const Koa = require('koa');
const bodyparser = require('koa-bodyparser');
const registerRouters = require('../router/index');
const errorHandler = require('../utils/handel-error');
const app = new Koa();
app.use(bodyparser());
registerRouters(app);
app.on('error', errorHandler);
module.exports = app;
