const app = require('./app/index');
const connection = require('./app/database');//connextion mysql
const { SERVER_PORT } = require('./config/server');
// require('./utils/handel-error');
app.listen(SERVER_PORT, () => {
  console.log('服务器启动成功🐮');
});
