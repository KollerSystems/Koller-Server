import { readFile } from 'fs/promises';
const options = JSON.parse(
  await readFile(
    new URL('../options.json', import.meta.url)
  )
);
const parameters = JSON.parse(
  await readFile(
    new URL('./params.json', import.meta.url)
  )
);

import supertest from 'supertest';
const request = supertest(`localhost:${options.api.port}/api`);
import { expect } from 'chai';


describe('Requesting users with various tokens', function() {
  for (let parameter in parameters.api.users) {
    const userdata = parameters.api.users[parameter];
    it(`${parameter != 'fake' ? '' : 'FAIL: '}GET /users/me - (${parameter})`, done => {
      request
        .get('/users/me')
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(parameter == 'fake' ? 401 : 200)
        .expect(res => {
          expect(res.body).to.be.an('object')
          if (parameter != 'fake') {
            expect(res.body).to.not.have.a.property('error');
            expect(res.body).to.have.a.property('UID', userdata.UID);
          }
        }).end(done);
    });

    if (parameter == 'fake') continue;

    it(`GET /users/${parameters.api.parameters.user.studentID} - (${parameter})`, done => {
      request
        .get('/users/'+parameters.api.parameters.user.studentID)
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('object');
          expect(res.body).to.not.have.a.property('error')
          expect(res.body).to.have.a.property('UID', parameters.api.parameters.user.studentID);
          if (parameter == 'student')
            expect(res.body).to.not.have.a.property(parameters.api.parameters.user.permDifferenceOn);
          else if (parameter == 'teacher')
            expect(res.body).to.have.a.property(parameters.api.parameters.user.permDifferenceOn);
        }).end(done);
    });
    it(`GET /users/${parameters.api.parameters.user.teacherID} - (${parameter})`, done => {
      request
        .get('/users/'+parameters.api.parameters.user.teacherID)
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('object');
          expect(res.body).to.not.have.a.property('error')
          expect(res.body).to.have.a.property('UID', parameters.api.parameters.user.teacherID);
        }).end(done);
    });

    it(`GET /users?role=teacher - (${parameter})`, done => {
      request
        .get('/users?role=teacher&sort=GuardianPhone&nulls=last')
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('array').and.to.have.lengthOf.at.most(options.api.batchRequests.defaultLimit);
          let GuardianPhones = [];
          for (let user of res.body) GuardianPhones.push(typeof user.GuardianPhone)
          expect(GuardianPhones).to.not.have.a('string');
        }).end(done);
    });
    it(`GET /users/offset=-${parameters.api.parameters.all.hugeInt} - (${parameter})`, done => {
      request
        .get(`/users?offset=${parameters.api.parameters.all.hugeInt}`)
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('array').which.is.empty;
        }).end(done);
    });

    const setSortedAndLimitedExpectations = req => {
      req
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('array').and.to.have.lengthOf.at.most(2);
          expect(res.body[0].UID).to.at.least(res.body[1].UID);
          expect(res.body[0].UID+1).to.eql(parameters.api.parameters.user.lastID);
        });

      return req;
    }

    it(`GET /users?sort=-{1},{2} - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/users?limit=2&offset=1&sort=-UID,Name')
      ).end(done);
    });
    it(`GET /users?sort={1}:desc,{2}:asc - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/users?limit=2&offset=1&sort=UID:desc,Name:asc')
      ).end(done);
    });
    it(`GET /users?sort={1},{2}&order=desc,asc - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/users?limit=2&offset=1&sort=UID,Name&order=desc,asc')
      ).end(done);
    });
  }
});
