// 这里是自动化程序
const fs = require('fs');
function registerRouters(app) {
  const files = fs.readdirSync(__dirname);
  // 只要是以.router.js结尾的文件都要
  for (const file of files) {
    if (!file.endsWith('.router.js')) continue;
    const router = require(`./${file}`);
    app.use(router.routes());
    app.use(router.allowedMethods());
  }
}
module.exports = registerRouters;
