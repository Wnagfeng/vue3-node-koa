const departmentService = require('../service/department.service');
class department {
  async create(ctx, next) {
    const departmentdata = ctx.request.body;
    const res = await departmentService.create(departmentdata);
    console.log(res);
    ctx.body = '创建部门';
  }
  async delete(ctx, next) {
    const { id } = ctx.params;
    const res = await departmentService.delete(id);
    ctx.body = {
      code: 0,
      message: '删除部门成功',
    };
  }

  async patch(ctx, next) {
    const { id } = ctx.params;
    const patchdata = ctx.request.body;
    const res = await departmentService.patch(id, patchdata);
    ctx.body = {
      code: 0,
      message: '修改部门信息',
    };
  }

  async get(ctx, next) {
    if (ctx.path === '/department/list') {
      const res = await departmentService.getlist(ctx.request.body);
      ctx.body = {
        res,
      };
      return res;
    }
    const { id } = ctx.params;
    const res = await departmentService.get(id);
    ctx.body = res;
  }
}
module.exports = new department();
