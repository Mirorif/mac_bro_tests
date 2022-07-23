class  UserGenerateResponse {
  String? message;
  Data? data;

  UserGenerateResponse({ this.message, this.data});

  UserGenerateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? userFound;
  ClientType? clientType;
  User? user;
  List<UserSessions>? userSessions;
  String? passcodeToken;
  int? period;

  Data(
      {this.userFound,
        this.clientType,
        this.user,
        this.userSessions,
        this.passcodeToken,
        this.period});

  Data.fromJson(Map<String, dynamic> json) {
    userFound = json['user_found'];
    clientType = json['client_type'] != null
        ? new ClientType.fromJson(json['client_type'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['user_sessions'] != null) {
      userSessions = <UserSessions>[];
      json['user_sessions'].forEach((v) {
        userSessions!.add(new UserSessions.fromJson(v));
      });
    }
    passcodeToken = json['passcode_token'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_found'] = this.userFound;
    if (this.clientType != null) {
      data['client_type'] = this.clientType!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.userSessions != null) {
      data['user_sessions'] =
          this.userSessions!.map((v) => v.toJson()).toList();
    }
    data['passcode_token'] = this.passcodeToken;
    data['period'] = this.period;
    return data;
  }
}

class ClientType {
  String? id;
  String? name;
  String? strategy;
  String? confirmBy;
  bool? phone;
  bool? email;
  bool? login;
  bool? selfRegister;
  bool? selfRecover;

  ClientType(
      {this.id,
        this.name,
        this.strategy,
        this.confirmBy,
        this.phone,
        this.email,
        this.login,
        this.selfRegister,
        this.selfRecover});

  ClientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    strategy = json['strategy'];
    confirmBy = json['confirm_by'];
    phone = json['phone'];
    email = json['email'];
    login = json['login'];
    selfRegister = json['self_register'];
    selfRecover = json['self_recover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['strategy'] = this.strategy;
    data['confirm_by'] = this.confirmBy;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['login'] = this.login;
    data['self_register'] = this.selfRegister;
    data['self_recover'] = this.selfRecover;
    return data;
  }
}

class User {
  String? id;
  String? clientTypeId;
  String? roleId;
  String? password;
  int? active;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.clientTypeId,
        this.roleId,
        this.password,
        this.active,
        this.expiresAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    roleId = json['role_id'];
    password = json['password'];
    active = json['active'];
    expiresAt = json['expires_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_type_id'] = this.clientTypeId;
    data['role_id'] = this.roleId;
    data['password'] = this.password;
    data['active'] = this.active;
    data['expires_at'] = this.expiresAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserSessions {
  String? clientPlatformId;
  String? clientTypeId;
  String? createdAt;
  String? data;
  String? expiresAt;
  String? id;
  String? ip;
  String? roleId;
  String? updatedAt;
  String? userId;

  UserSessions(
      {this.clientPlatformId,
        this.clientTypeId,
        this.createdAt,
        this.data,
        this.expiresAt,
        this.id,
        this.ip,
        this.roleId,
        this.updatedAt,
        this.userId});

  UserSessions.fromJson(Map<String, dynamic> json) {
    clientPlatformId = json['client_platform_id'];
    clientTypeId = json['client_type_id'];
    createdAt = json['created_at'];
    data = json['data'];
    expiresAt = json['expires_at'];
    id = json['id'];
    ip = json['ip'];
    roleId = json['role_id'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_platform_id'] = this.clientPlatformId;
    data['client_type_id'] = this.clientTypeId;
    data['created_at'] = this.createdAt;
    data['data'] = this.data;
    data['expires_at'] = this.expiresAt;
    data['id'] = this.id;
    data['ip'] = this.ip;
    data['role_id'] = this.roleId;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
