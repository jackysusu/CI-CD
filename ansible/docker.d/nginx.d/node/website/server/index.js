const fastify = require('fastify')();
const os = require("os");
const hostname = os.hostname();
const { PORT } = process.env;

fastify.get('/', (req, reply) => {
  console.log('process pid =>', process.pid);
  reply.send('Hello World. Container ID: ' + hostname);
});

fastify.listen(PORT, err => {
  if (err) throw err;
  console.log('Server listening on port ' + PORT);
});