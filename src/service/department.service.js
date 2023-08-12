const database = require('../app/database');
class departmentService {
  async create(departmentdata) {
    const statement = 'INSERT INTO department SET ?';
    const [result] = await database.query(statement, [departmentdata]);
    return result;
  }

  async delete(id) {
    const statement = `DELETE FROM department WHERE id = ?`;
    const [result] = await database.execute(statement, [Number(id)]);
    return result;
  }

  async patch(id, patchdata) {
    let res = [];
    for (const item in patchdata) {
      const statement = `UPDATE department SET ${item} = ? WHERE id = ?;`;
      const [result] = await database.query(statement, [patchdata[item], id]);
      res = result;
    }
    return res;
  }

  async getlist(data) {
    const statement = `
    SELECT department.name name,
    department.leader leader,
    department.createAt createAt,
    department.updateAt updateAt,
    department.parentId parentId
    FROM department  LIMIT ?,?;
`;
    const [result] = await database.query(statement, [data.offset, data.size]);
    return result;
  }

  async get(id) {
    const statement = `
    SELECT department.name name,
    department.leader leader,
    department.createAt createAt,
    department.updateAt updateAt,
    department.parentId parentId
    FROM department WHERE id=?;
`;
    const [result] = await database.query(statement, [id]);
    return result;
  }
}
module.exports = new departmentService();
