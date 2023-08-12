const router = require('@koa/router');
const { verifyLogin ,verifyAuth} = require('../middleware/auth.middleware');
const login = require('../control/login.control');
const LoginRouter = new router({ prefix: '/login' });

LoginRouter.post('/', verifyLogin, login.login);

module.exports = LoginRouter;
