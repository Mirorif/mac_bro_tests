class UserConfirmResponse {
  Data? data;
  String? message;

  UserConfirmResponse({this.data, this.message});

  UserConfirmResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  ClientType? clientType;
  Token? token;
  User? user;
  bool? userFound;
  List<UserSessions>? userSessions;

  Data(
      {this.clientType,
        this.token,
        this.user,
        this.userFound,
        this.userSessions});

  Data.fromJson(Map<String, dynamic> json) {
    clientType = json['client_type'] != null
        ? new ClientType.fromJson(json['client_type'])
        : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userFound = json['user_found'];
    if (json['user_sessions'] != null) {
      userSessions = <UserSessions>[];
      json['user_sessions'].forEach((v) {
        userSessions!.add(new UserSessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientType != null) {
      data['client_type'] = this.clientType!.toJson();
    }
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_found'] = this.userFound;
    if (this.userSessions != null) {
      data['user_sessions'] =
          this.userSessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientType {
  String? confirmBy;
  bool? email;
  String? id;
  bool? login;
  String? name;
  bool? phone;
  bool? selfRecover;
  bool? selfRegister;
  String? strategy;

  ClientType(
      {this.confirmBy,
        this.email,
        this.id,
        this.login,
        this.name,
        this.phone,
        this.selfRecover,
        this.selfRegister,
        this.strategy});

  ClientType.fromJson(Map<String, dynamic> json) {
    confirmBy = json['confirm_by'];
    email = json['email'];
    id = json['id'];
    login = json['login'];
    name = json['name'];
    phone = json['phone'];
    selfRecover = json['self_recover'];
    selfRegister = json['self_register'];
    strategy = json['strategy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirm_by'] = this.confirmBy;
    data['email'] = this.email;
    data['id'] = this.id;
    data['login'] = this.login;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['self_recover'] = this.selfRecover;
    data['self_register'] = this.selfRegister;
    data['strategy'] = this.strategy;
    return data;
  }
}

class Token {
  String? accessToken;
  String? createdAt;
  String? expiresAt;
  int? refreshInSeconds;
  String? refreshToken;
  String? updatedAt;

  Token(
      {this.accessToken,
        this.createdAt,
        this.expiresAt,
        this.refreshInSeconds,
        this.refreshToken,
        this.updatedAt});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    createdAt = json['created_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
    refreshToken = json['refresh_token'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['created_at'] = this.createdAt;
    data['expires_at'] = this.expiresAt;
    data['refresh_in_seconds'] = this.refreshInSeconds;
    data['refresh_token'] = this.refreshToken;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? active;
  String? clientTypeId;
  String? createdAt;
  String? expiresAt;
  String? id;
  String? password;
  String? roleId;
  String? updatedAt;

  User(
      {this.active,
        this.clientTypeId,
        this.createdAt,
        this.expiresAt,
        this.id,
        this.password,
        this.roleId,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    clientTypeId = json['client_type_id'];
    createdAt = json['created_at'];
    expiresAt = json['expires_at'];
    id = json['id'];
    password = json['password'];
    roleId = json['role_id'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['client_type_id'] = this.clientTypeId;
    data['created_at'] = this.createdAt;
    data['expires_at'] = this.expiresAt;
    data['id'] = this.id;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
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
