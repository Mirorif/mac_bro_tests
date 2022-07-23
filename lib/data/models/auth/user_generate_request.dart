class UserGenerateRequest {
  String? clientTypeId;
  String? password;
  String? username;
  String? tag;

  UserGenerateRequest({required this.clientTypeId, required this.password , required this.username, required this.tag});

  UserGenerateRequest.fromJson(Map<String, dynamic> json) {
    clientTypeId = json['client_type_id'];
    password = json['password'];
    tag = json['tag'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_type_id'] = this.clientTypeId;
    data['password'] = this.password;
    data['username'] = this.username;
    data['tag'] = this.tag;
    return data;
  }
}

