
class LoginService {


  async success(ctx, next) {
    ctx.body = '授权成功~';
  }
}
module.exports = new LoginService();
