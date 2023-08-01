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
const request = supertest(`localhost:${options.api.port}/oauth`);
import { expect } from 'chai';


describe('Getting token & refreshing it with various credentials', () => {
  for (let parameter of parameters.oauth) {
    let refresh_token = undefined;
    it(`${parameter.succeed ? '' : 'FAIL: '}POST /token - application/json: ${parameter.credentials.username}`, done => {
      request
        .post('/token')
        .send(parameter.credentials)
        .set('Content-Type', 'application/json')
        .expect('Content-Type', /json/)
        .expect(parameter.succeed ? 200 : 400)
        .expect(res => {
          expect(res.body).to.be.an('object');
          if (parameter.succeed) {
            expect(res.body).to.have.keys('access_token', 'refresh_token', 'token_type', 'expires_in');
            refresh_token = res.body.refresh_token;
          } else expect(res.body).to.have.a.key('error');
        }).end(done);
      });

    it(`${parameter.succeed ? '' : 'FAIL: '}POST /token - application/x-www-form-urlencoded: ${parameter.credentials.username}`, done => {
      request
        .post('/token')
        .set('Content-Type', 'application/x-www-form-urlencoded')
        .send((new URLSearchParams(parameter.credentials)).toString())
        .expect('Content-Type', /json/)
        .expect(parameter.succeed ? 200 : 400)
        .expect(res => {
          expect(res.body).to.be.an('object');
          if (parameter.succeed)
            expect(res.body).to.have.keys('access_token', 'refresh_token', 'token_type', 'expires_in');
          else expect(res.body).to.have.a.key('error');
        }).end(done);
    });

    if (!parameter.succeed) continue;
    it('POST /token - (refresh token)', done => {
      request
        .post('/token')
        .set('Content-Type', 'application/json')
        .send({'grant_type': 'refresh_token', 'refresh_token': refresh_token})
        .expect('Content-Type', /json/)
        .expect(200)
        .expect(res => {
          expect(res.body).to.be.an('object');
          expect(res.body).to.not.have.a.key('error');
          expect(res.body).to.have.keys('access_token', 'refresh_token', 'token_type', 'expires_in');
        }).end(done);
    });
  }
});
