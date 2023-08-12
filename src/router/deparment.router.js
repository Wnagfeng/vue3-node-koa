const router = require('@koa/router');
const department = require('../control/department.control');
const departmentRouter = new router({ prefix: '/department' });
const { verifyAuth } = require('../middleware/auth.middleware');
departmentRouter.post('/', verifyAuth, department.create);
departmentRouter.delete('/:id', verifyAuth, department.delete);
departmentRouter.patch('/:id', verifyAuth, department.patch);
departmentRouter.get('/:id', verifyAuth, department.get);
module.exports = departmentRouter;
