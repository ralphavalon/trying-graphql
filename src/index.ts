import * as http from 'http';  

import app from './app';

const server = http.createServer(app);

server.listen(8080);
server.on('listening', () => console.log('Listening...'));
