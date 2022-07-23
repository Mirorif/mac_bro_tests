class UserExistsResponse {
  bool? exists;

  UserExistsResponse({this.exists});

  UserExistsResponse.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exists'] = this.exists;
    return data;
  }
}
