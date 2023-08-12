const userService = require('../service/user.Service');
class user {
  async create(ctx, next) {
    const userdata = ctx.request.body;
    const res = await userService.create(userdata);
    ctx.body = '创建用户';
  }

  async get(ctx, next) {
    if (ctx.path === '/users/list') {
      const querydata = ctx.request.body;
      const res = await userService.getlist(querydata);
      ctx.body = {
        res,
      };
      return res;
    }
    const { id } = ctx.params;
    const res = await userService.get(id);
    ctx.body = res;
  }
  async delete(ctx, next) {
    const { id } = ctx.params;
    const res = await userService.delete(id);
    ctx.body = {
      code: 0,
      message: '删除用户成功',
    };
  }

  async patch(ctx, next) {
    const { id } = ctx.params;
    const patchdata = ctx.request.body;
    const res = await userService.patch(id, patchdata);
    ctx.body = {
      code: 0,
      message: '修改用户信息',
    };
  }
}
module.exports = new user();
