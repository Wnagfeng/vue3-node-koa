const errorTypes = require('../config/error-constance');

const errorHandler = (error, ctx) => {
  let status, message;

  switch (error.message) {
    case errorTypes.NAME_OR_PASSWORD_IS_REQUIRED:
      status = 400; // Bad Request
      message = '用户名或者密码不能为空~';
      break;
    case errorTypes.USER_ALREADY_EXISTS:
      status = 409; // conflict
      message = '用户名已经存在~';
      break;
    case errorTypes.USER_DOES_NOT_EXISTS:
      status = 400; // 参数错误
      message = '用户不存在~';
      break;
    case errorTypes.PASSWORD_IS_INCORRENT:
      status = 400; // 参数错误
      message = '密码是错误的~';
      break;
    case errorTypes.UNAUTHORIZATION:
      status = 401; // 参数错误
      message = '无效的token~';
      break;
    case errorTypes.UNPERMISSION:
      status = 401; // 参数错误
      message = '您不具备操作的权限~';
      break;
    case errorTypes.ROLENAMEALREADYEXISTS:
      status = 401; // 参数错误
      message = '当前角色名字已存在~';
      break;
    default:
      status = 404;
      message = 'NOT FOUND';
  }

  ctx.status = status;
  ctx.body = message;
};

module.exports = errorHandler;
