import request from 'supertest';
import { app} from "../../../index";

describe('Company Endpoints', () => {
  it('should fetch all companies', async () => {
    const res = await request(app)
      .get('/api/companies')
      .send();
    
    expect(res.statusCode).toEqual(200);
    expect(Array.isArray(res.body)).toBeTruthy();
  });
  
  it('should create a new company', async () => {
    const res = await request(app)
      .post('/api/companies')
      .send({
        name: 'Test Company',
        notes: 'Test description',
      });
    
    expect(res.statusCode).toEqual(201);
    expect(res.body.name).toEqual('Test Company');
    expect(res.body.notes).toEqual('Test description');
  });
});