const request = require('supertest');
const app = require('../src/app');

describe('GET /', () => {
    it('should respond with a message indicating the app is running', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toContain('Node.js application is running');
    });
});