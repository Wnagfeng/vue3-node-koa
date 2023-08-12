const router = require('@koa/router');
const menu = require('../control/menu.control');
const menuRouter = new router({ prefix: '/menu' });
const { verifyAuth } = require('../middleware/auth.middleware');
menuRouter.post('/', verifyAuth, menu.create);
menuRouter.get('/:id', verifyAuth, menu.get);
menuRouter.delete('/:id', verifyAuth, menu.delete);
menuRouter.patch('/:id', verifyAuth, menu.patch);

module.exports = menuRouter;
