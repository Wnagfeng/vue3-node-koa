const menuService = require('../service/menu.service');
const errorTypes = require('../config/error-constance');
class menu {
  async create(ctx, next) {
    const meundata = ctx.request.body;
    const res = await menuService.create(meundata);
    console.log(res);

    // console.log(meundata);

    ctx.body = '创建菜单';
  }

  async get(ctx, next) {
    if (ctx.path == '/menu/list') {
      const res = await menuService.get();
      ctx.body = {
        code: 0,
        message: '查询成功',
        data: res,
      };
    } else {
      console.log(ctx.params);
      
      const res = await menuService.getlist(ctx.params.id);
      ctx.body = {
        code: 0,
        message: '查询成功',
        data: res,
      };
    }
  }

  async delete(ctx, next) {
    const { id } = ctx.params;
    const res = await menuService.delete(id);
    ctx.body = {
      code: 0,
      message: '删除菜单成功',
    };
  }

  async patch(ctx, next) {
    const { id } = ctx.params;
    const patchdata = ctx.request.body;
    const res = await menuService.patch(id, patchdata);
    if (res == false) {
      const error = new Error(errorTypes.ROLENAMEALREADYEXISTS);
      return ctx.app.emit('error', error, ctx);
    }
    ctx.body = {
      code: 0,
      message: '修改菜单信息',
    };
  }
}

module.exports = new menu();
