class User {
    constructor(userId, userAgentCode, userName, userType, password ) {
      this.userId = userId;
      this.userAgentCode = userAgentCode;
      this.userName = userName;
      this.userType = userType;
      this.password = password;
    }
}
  
  module.exports = User;