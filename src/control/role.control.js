const roleService = require('../service/role.service');
const errorTypes = require('../config/error-constance');
class role {
  async create(ctx, next) {
    const res = await roleService.create(ctx.request.body);
    ctx.body = '创建角色';
  }

  async get(ctx, next) {
    const { offset, size } = ctx.query;
    const res = await roleService.get(Number(offset), Number(size));

    // 根据查询的到的角色 获取到每个角色的权限
    for (const role of res) {
      const menu = await roleService.getrolemeun(role.id);
      role.menu = menu;
    }
    ctx.body = {
      code: 0,
      message: '获取成功',
      data: res,
    };
  }

  async delete(ctx, next) {
    const { id } = ctx.params;
    const res = await roleService.delete(id);
    ctx.body = {
      code: 0,
      message: '删除角色成功',
    };
  }

  async patch(ctx, next) {
    const { id } = ctx.params;
    const patchdata = ctx.request.body;
    const res = await roleService.patch(id, patchdata);
    if (res == false) {
      const error = new Error(errorTypes.ROLENAMEALREADYEXISTS);
      return ctx.app.emit('error', error, ctx);
    }
    ctx.body = {
      code: 0,
      message: '修改用户信息',
    };
  }
}
module.exports = new role();
