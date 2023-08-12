const database = require('../app/database');
const md5password = require('../utils/password-handle');
class userService {
  async create(userdata) {
    const statement = 'INSERT INTO user SET ?';
    const [result] = await database.query(statement, [userdata]);
    return result;
  }

  async getUserByName(name) {
    const statement = `SELECT * FROM user WHERE name = ?;`;
    const result = await database.execute(statement, [name]);
    return result[0];
  }

  async get(id) {
    const statement = `
        SELECT user.id id,user.name name,user.realname reanlname,user.cellphone phonenumber,user.updateAt updateAt,user.createAt createAt,user.enable enable,
        JSON_OBJECT("id",r.id,"intro",r.intro,"name",r.name,"createAt",r.createAt,"updateAt",r.updateAt) AS 'role',
        JSON_OBJECT("id",de.id,"leader",de.leader,"name",de.name,"createAt",de.createAt,"updateAt",de.updateAt) AS 'department'
        from user
        LEFT JOIN role r ON user.roleid=r.id
        LEFT JOIN department de ON user.departmentId=de.id
        WHERE user.id=?;
    `;
    const [result] = await database.execute(statement, [id]);
    return result;
  }

  async delete(id) {
    const statement = `DELETE FROM user WHERE id = ?`;
    const [result] = await database.execute(statement, [Number(id)]);
    return result;
  }

  async patch(id, patchdata) {
    if (patchdata.password) {
      patchdata.password = md5password(patchdata.password);
    }
    let res = [];
    for (const item in patchdata) {
      const statement = `UPDATE user SET ${item} = ? WHERE id = ?;`;
      const [result] = await database.query(statement, [patchdata[item], id]);
      res = result;
    }
    return res;
  }

  async getlist(querydata) {
    const { cellphone } = querydata;
    const { name } = querydata;
    const { offset } = querydata;
    const { size } = querydata;

    const statement = `
    SELECT user.id id,user.name name,user.realname reanlname,user.cellphone phonenumber,user.updateAt updateAt,user.createAt createAt,user.enable enable,
    JSON_OBJECT("id",r.id,"intro",r.intro,"name",r.name,"createAt",r.createAt,"updateAt",r.updateAt) AS 'role',
    JSON_OBJECT("id",de.id,"leader",de.leader,"name",de.name,"createAt",de.createAt,"updateAt",de.updateAt) AS 'department'
    from user
    LEFT JOIN role r ON user.roleid=r.id
    LEFT JOIN department de ON user.departmentId=de.id
    WHERE user.cellphone LIKE CONCAT('%', ?, '%') AND user.name LIKE CONCAT('%', ?, '%')  LIMIT ?,?;
`;
    const [result] = await database.query(statement, [
      Number(cellphone),
      name,
      Number(offset),
      Number(size),
    ]);

    return result;
  }
}
module.exports = new userService();
