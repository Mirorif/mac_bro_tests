class UserRequest {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? profileImage;

  UserRequest(
      {this.firstName, this.lastName, this.phoneNumber, this.profileImage});

  UserRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
