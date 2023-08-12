const jwt = require('jsonwebtoken');
const { PRIVATE_KEY } = require('../app/config');
class login {
  async login(ctx, next) {
    const { id, name } = ctx.user; 
    const token = jwt.sign({ id, name }, PRIVATE_KEY, {
      expiresIn: 60 * 60 * 24,
      algorithm: 'RS256',
    });

    ctx.body = { id, name, token ,state:"登录成功"};
  }
}
module.exports = new login();
