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

describe('Requesting rooms with various tokens', function() {
  for (let parameter in parameters.api.users) {
    const userdata = parameters.api.users[parameter];

    const codes = {'fake': 401, 'teacher': 404, 'student': 200}
    it(`${['fake', 'teacher'].includes(parameter) ? 'FAIL: ' : ''}GET /rooms/me - (${parameter})`, done => {
      request
        .get('/rooms/me')
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(codes[parameter])
        .expect(res => {
          expect(res.body).to.be.an('object');
          if (parameter == 'student') {
            expect(res.body).to.have.a.property('RID', userdata.RID);
            expect(res.body).to.have.a.property('UID', userdata.UID)
            expect(res.body).to.have.a.property('Residents').which.is.an('array');
          } else {
            expect(res.body).to.have.a.property('error');
          }
        }).end(done);
    });

    if (parameter == 'fake') continue;

    it(`GET /rooms/${parameters.api.parameters.rooms.roomID} - (${parameter})`, done => {
      request
        .get(`/rooms/${parameters.api.parameters.rooms.roomID}`)
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('object');
          expect(res.body).to.have.a.property('RID', parameters.api.parameters.rooms.roomID);
          expect(res.body).to.have.a.property('Residents').which.is.an('array');
          let RIDsOfResidents = [];
          for (let resident of res.body.Residents) RIDsOfResidents.push(typeof resident.RID);
          expect(RIDsOfResidents).to.not.have.a('number');
        }).end(done);
    });
    it(`GET /rooms/${parameters.api.parameters.all.hugeInt} - (${parameter})`, done => {
      request
        .get(`/rooms/${parameters.api.parameters.all.hugeInt}`)
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(404)
        .expect(res => {
          expect(res.body).to.be.an('object').and.to.have.a.property('error');
        }).end(done);
    });

    const setSortedAndLimitedExpectations = req => {
      req
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('array').and.to.have.lengthOf.at.most(2);
          expect(res.body[0].RID).to.be.at.least(res.body[1].RID);
        });

      return req;
    }

    it(`GET /rooms?sort=-{1},{2} - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/rooms?limit=2&offset=1&sort=-RID,Group')
      ).end(done);
    });
    it(`GET /rooms?sort={1}:desc,{2}:asc - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/rooms?limit=2&offset=1&sort=RID:desc,Group:asc')
      ).end(done);
    });
    it(`GET /rooms?sort={1},{2}&order=desc,asc - (${parameter})`, done => {
      setSortedAndLimitedExpectations(
        request.get('/rooms?limit=2&offset=1&sort=RID,Group&order=desc,asc')
      ).end(done);
    });

    const setFilteredExpectations = req => {
      req
        .set('Authorization', 'Bearer ' + userdata.access_token)
        .expect('Content-Type', /json/)
        .expect(200);

      return req;
    }

    it(`GET /rooms?{1}=17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?RID=17')
      ).expect(res => {
        expect(res.body).to.be.an('array').and.to.have.a.lengthOf(1);
        expect(res.body[0].RID).to.equal(17);
      }).end(done);
    });
    it(`GET /rooms?{1}[gt]=17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?RID[gt]=17&sort=RID')
      ).expect(res => {
        expect(res.body).to.be.an('array');
        expect(res.body[0].RID).to.be.above(17);
      }).end(done);
    });
    it(`GET /rooms?{1}[gte]=17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?RID[gte]=17&sort=RID')
      ).expect(res => {
        expect(res.body).to.be.an('array');
        expect(res.body[0].RID).to.be.equal(17);
        expect(res.body[1].RID).to.be.above(17);
      }).end(done);
    });
    it(`GET /rooms?{1}[lt]=17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?RID[lt]=172&sort=-RID')
      ).expect(res => {
        expect(res.body).to.be.an('array');
        expect(res.body[0].RID).to.be.below(172);
      }).end(done);
    });
    it(`GET /rooms?{1}=gt:17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?RID=gt:17&sort=RID')
      ).expect(res => {
        expect(res.body).to.be.an('array');
        expect(res.body[0].RID).to.be.above(17);
      }).end(done);
    });
    it(`GET /rooms?filter={1}[gt]:17 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?filter=RID[gt]:17&sort=RID')
      ).expect(res => {
        expect(res.body).to.be.an('array');
        expect(res.body[0].RID).to.be.above(17);
      }).end(done);
    });
    it(`GET /rooms?filter={1}[lt]:0 - (${parameter})`, done => {
      setFilteredExpectations(
        request.get('/rooms?filter=RID[lt]:0')
      ).expect(res => {
        expect(res.body).to.be.an('array').that.has.a.lengthOf(0);
      }).end(done);
    });
  }
});