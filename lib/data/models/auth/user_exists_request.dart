class  UserExistsRequest {
  String? phoneNumber;

  UserExistsRequest({required this.phoneNumber});

  UserExistsRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
