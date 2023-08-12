const database = require('../app/database');
const menuService = require('../service/menu.service');
class roleService {
  async create(roledata) {
    // 拿到不同的字段
    const name = roledata.name;
    const intro = roledata.intro;
    let roleId = '';
    const menuId = roledata.menuList;
    const statement = 'INSERT INTO `role` (name, intro) VALUES (?, ?);';
    const [result] = await database.execute(statement, [name, intro]);
    if (result) {
      console.log('创建成功');
      // 更据name拿到role id
      const statement1 = 'SELECT id from role WHERE role.`name`=?';
      const [result1] = await database.execute(statement1, [name]);
      roleId = result1[0].id;
    }
    // 通过角色id去存储角色的权限
    // 存储之前先把当前的所有的依赖关系清空掉
    const statement2 = 'DELETE FROM role_menu WHERE roleId=?';
    const [result2] = await database.execute(statement2, [roleId]);
    // 插入新的数据 权限列表
    const statement3 =
      'INSERT INTO `role_menu` (roleId, menuId) VALUES (?, ?);';
    let res = null;
    for (const menuid of menuId) {
      const [result] = await database.query(statement3, [roleId, menuid]);
      res = result;
    }
    return res;
  }

  async get(offset = 0, size = 10) {
    const statement = 'SELECT * FROM role LIMIT ?,?;';
    const [result] = await database.query(statement, [offset, size]);
    return result;
  }

  async getrolemeun(roleid) {
    const statement =
      'SELECT rm.roleId,JSON_ARRAYAGG(rm.menuId) menuIds FROM role_menu rm WHERE rm.roleId=? GROUP BY rm.roleId';
    const [menuIds] = await database.query(statement, [roleid]);
    const menuid = menuIds[0]?.menuIds;

    // 获取到所有的菜单数
    const res = await menuService.get();

    //根据menuid去过滤出我们需要的菜单树
    function fillterMenu(menu) {
      const newmenu = [];
      for (const item of menu) {
        if (item.children) {
          item.children = fillterMenu(item.children);
        }
        if (menuid == undefined) {
          menuIds.push(null);
        } else {
          if (menuid.includes(item.id)) {
            newmenu.push(item);
          }
        }
      }
      return newmenu;
    }
    const finalMenu = fillterMenu(res);
    return finalMenu;
  }

  async delete(id) {
    const statement = `DELETE FROM role WHERE id = ?`;
    const [result] = await database.execute(statement, [Number(id)]);
    return result;
  }

  async patch(id, patchdata) {
    if (patchdata.name) {
      const res = await this.getroleByName(patchdata.name);
      if (res[0]) {
        return false;
      }
    }
    let res = [];
    for (const item in patchdata) {
      const statement = `UPDATE role SET ${item} = ? WHERE id = ?;`;
      const [result] = await database.query(statement, [patchdata[item], id]);
      res = result;
    }
    return res;
  }
  async getroleByName(name) {
    const statement = `SELECT * FROM role WHERE name = ?;`;
    const result = await database.execute(statement, [name]);
    return result[0];
  }
  async getUserById(id) {
    const statement = `SELECT * FROM role WHERE id = ?;`;
    const result = await database.execute(statement, [id]);
    return result[0];
  }
}
module.exports = new roleService();
