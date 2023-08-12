const router = require('@koa/router');
const role = require('../control/role.control');
const roleRouter = new router({ prefix: '/role' });
const { verifyAuth } = require('../middleware/auth.middleware');
roleRouter.post('/',verifyAuth, role.create);
roleRouter.get('/',verifyAuth, role.get);
roleRouter.delete('/:id', verifyAuth, role.delete);
roleRouter.patch('/:id', verifyAuth, role.patch);

module.exports = roleRouter;
