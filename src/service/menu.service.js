const database = require('../app/database');
class menuService {
  async create(menudata) {
    const statement = 'INSERT INTO menu SET ?';
    const [result] = await database.query(statement, [menudata]);
    return result;
  }
  async get() {
    const statement = `SELECT 
	m1.id id, m1.name name, m1.type type, m1.url url, m1.icon icon, m1.sort sort, m1.createAt createAt, m1.updateAt updateAt,
	
	(SELECT JSON_ARRAYAGG(
		JSON_OBJECT(
		"id", m2.id, "name", m2.name, "type", m2.type, "parentId", m2.parentId, 
		"url", m2.url,"sort", m2.sort, "createAt", m2.createAt, "updateAt", m2.updateAt,
		"children", 
	(SELECT JSON_ARRAYAGG(
			JSON_OBJECT("id", m3.id, "name", m3.name, "type", m3.type, "parentId", m3.parentId,
			"url", m3.url, "sort", m3.sort, "permission", m3.permission, "createAt", m3.createAt,
			"updateAt", m3.updateAt)
		) FROM menu m3 WHERE m3.parentId = m2.id ORDER BY m3.sort))
	) FROM menu m2 WHERE m1.id = m2.parentId ORDER BY m2.sort) children

FROM menu m1 
WHERE m1.type = 1;`;
    const [result] = await database.query(statement);
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
      const statement = `UPDATE menu SET ${item} = ? WHERE id = ?;`;
      const [result] = await database.query(statement, [patchdata[item], id]);
      res = result;
    }
    return res;
  }
  async getroleByName(name) {
    const statement = `SELECT * FROM menu WHERE name = ?;`;
    const result = await database.execute(statement, [name]);
    return result[0];
  }

  async delete(id) {
    const statement = `DELETE FROM menu WHERE id = ?`;
    const [result] = await database.execute(statement, [Number(id)]);
    return result;
  }

  async getlist(id) {
    const statement = `SELECT 
	m1.id id, m1.name name, m1.type type, m1.url url, m1.icon icon, m1.sort sort, m1.createAt createAt, m1.updateAt updateAt,
	(SELECT JSON_ARRAYAGG(
		JSON_OBJECT(
		"id", m2.id, "name", m2.name, "type", m2.type, "parentId", m2.parentId, 
		"url", m2.url,"sort", m2.sort, "createAt", m2.createAt, "updateAt", m2.updateAt,
		"children", 
	(SELECT JSON_ARRAYAGG(
			JSON_OBJECT("id", m3.id, "name", m3.name, "type", m3.type, "parentId", m3.parentId,
			"url", m3.url, "sort", m3.sort, "permission", m3.permission, "createAt", m3.createAt,
			"updateAt", m3.updateAt)
		) FROM menu m3 WHERE m3.parentId = m2.id ORDER BY m3.sort))
	) FROM menu m2 WHERE m1.id = m2.parentId ORDER BY m2.sort) children
FROM menu m1 
WHERE m1.id = ?;`;
    const [result] = await database.execute(statement, [Number(id)]);
    return result;
  }
}
module.exports = new menuService();
