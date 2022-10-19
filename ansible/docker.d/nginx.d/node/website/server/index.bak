const fastify = require('fastify')();

const { PORT } = process.env;

fastify.get('/', (req, reply) => {
  console.log('process pid =>', process.pid);
  reply.send('Hello World');
});

fastify.listen(PORT, err => {
  if (err) throw err;
  console.log('Server listening on port ' + PORT);
});
