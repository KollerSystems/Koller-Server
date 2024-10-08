import { Router } from 'express';
import { knx } from '../index.js';
import { setupBatchRequest } from '../helpers/batchRequests.js';
import { classicErrorSend, getPermittedFields, filterByPermission, selectCoalesce, addCoalesces } from '../helpers/helpers.js';
import { isEmptyObject } from '../helpers/misc.js';

const rooms = Router({ mergeParams: false });

rooms.get('/', async (req, res, next) => {
  let data = knx('dorm_room').select(getPermittedFields('dorm_room', res.locals.roleID));
  // fieldsPermitted.splice(fieldsPermitted.indexOf('RID'), 1);

  data = await setupBatchRequest(data, req.query, req.url, {}, [
    { 'flexible': true, 'point': 'Group', 'join': [ 'GroupID', 'ID' ], 'query': { 'fields': getPermittedFields('group', res.locals.roleID, false), 'table': 'group' } },
    { 'flexible': true, 'point': 'Annexe', 'join': [ 'AID', 'ID' ], 'query': { 'fields': getPermittedFields('annexe', res.locals.roleID, false), 'table': 'annexe' } },
    { 'flexible': false, 'point': 'Residents', 'callback': async parent => {
      const fields = selectCoalesce([
        { 'fields': getPermittedFields('resident', res.locals.roleID, false), 'table': 'resident' },
        { 'fields': [ 'ClassID' ], 'table': 'student' },
        { 'fields': [ 'Name' ], 'table': 'user' },
        { 'fields': getPermittedFields('class', res.locals.roleID, false), 'table': 'class' }
      ]);
      const query = knx('resident').select(...fields.selects).join('student', 'student.UID', 'resident.UID').join('user', 'user.UID', 'resident.UID').where('resident.RID', parent.RID);
      addCoalesces(query, fields.coalesces);
      let d = await setupBatchRequest(query, {}, '', { 'ignoreLimit': true, 'ignoreOffset': true }, [
        { 'flexible': true, 'point': 'Class', 'join': [ 'ClassID', 'ID' ], 'query': { 'fields': getPermittedFields('class', res.locals.roleID, false), 'table': 'class' } }
      ], { 'ClassID': undefined, 'ID': undefined, 'Old': undefined });
      return d;
      // return await knx('resident').select(fieldsPermitted).joinRaw('natural join student').join('class', 'class.ID', 'student.ClassID').where('RID', parent.RID);
    } }
  ], { 'GroupID': undefined, 'AID': undefined });

  res.header('Content-Type', 'application/json').status(200).send(data).end();

  next();
});

/**
 * Repetíciót elkerülő specifikus függvény. Lekérés eredményére mount-ol Group és Annexe adatokat.
 * @param {import('express').Response} res
 * @param {object} data módosítandó lekérési eredmény
 */
const mountWhenPossible = async (res, data) => {
  const [ groupdata, annexdata ] = await Promise.all( [
    knx('group').first(getPermittedFields('group', res.locals.roleID)).where('ID', data.GroupID ?? -1),
    knx('annexe').first(getPermittedFields('annexe', res.locals.roleID)).where('ID', data.AID ?? -1)
  ] );

  if (data.GroupID ?? '') data.Group = groupdata;
  delete data.GroupID;

  if (data.AID ?? '') data.Annexe = annexdata;
  delete data.AID;
};

rooms.get('/me', async (req, res, next) => {
  const prequery = await knx('student').first('RID').where('UID', res.locals.UID); // kell lennie UIDnak, nem kell check
  let data = await knx('dorm_room').first(getPermittedFields('dorm_room', res.locals.roleID)).where('RID', prequery.RID);

  await mountWhenPossible(res, data);

  data.UID = parseInt(res.locals.UID, 10);

  const postquery = await knx('resident').select(getPermittedFields('resident', res.locals.roleID, true).concat([ 'Name', 'Picture', 'ClassID' ])).leftJoin('user', 'user.UID', 'resident.UID').leftJoin('student', 'student.UID', 'resident.UID').where('resident.RID', prequery.RID);
  for (let i = 0; i < postquery.length; i++) {
    postquery[i].Class = await knx('class').first(getPermittedFields('class', res.locals.roleID)).where('ID', postquery[i]?.ClassID);
    delete postquery[i].ClassID;
  }
  data.Residents = postquery;

  res.header('Content-Type', 'application/json').status(200).send(data).end();
  next();
});

rooms.get('/:id(-?\\d+)', async (req, res, next) => {
  const data = await knx('dorm_room').first('*').where('RID', req.params.id);
  if (data == undefined) return classicErrorSend(res, 'missing_resource');

  const filteredData = filterByPermission(data, 'dorm_room', res.locals.roleID);
  if (isEmptyObject(filteredData)) return classicErrorSend(res, 'missing_permissions');

  await mountWhenPossible(res, filteredData);

  const residents = await knx('resident').select(getPermittedFields('resident', res.locals.roleID, true).concat([ 'Name', 'Picture', 'ClassID' ])).leftJoin('user', 'user.UID', 'resident.UID').leftJoin('student', 'student.UID', 'resident.UID').where('resident.RID', req.params.id);
  for (let i = 0, resident = residents[i]; i < residents.length; resident = residents[++i]) {
    resident.Class = await knx('class').first(getPermittedFields('class', res.locals.roleID)).where('ID', resident?.ClassID);
    delete resident.ClassID;
  }
  filteredData.Residents = residents;

  res.header('Content-Type', 'application/json').status(200).send(filteredData).end();
  next();
});

export { rooms };
