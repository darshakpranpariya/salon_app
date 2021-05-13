class UserModel {
  String userName;
  String emailId;
  String password;
  String dob;
  String address;

  UserModel(
      {this.userName, this.emailId, this.address, this.dob, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    emailId = json['emailId'];
    password = json["password"];
    dob = json["dob"];
    address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['emailId'] = this.emailId;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['address'] = this.address;
    return data;
  }
}
