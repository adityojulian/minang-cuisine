class ProfileModel {
  int? points;
  String? password;
  String? lastName;
  String? ewallet;
  String? firstName;
  int? balance;

  ProfileModel(
      {this.points,
      this.password,
      this.lastName,
      this.ewallet,
      this.firstName,
      this.balance});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    password = json['password'];
    lastName = json['last_name'];
    ewallet = json['ewallet'];
    firstName = json['first_name'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    data['password'] = this.password;
    data['last_name'] = this.lastName;
    data['ewallet'] = this.ewallet;
    data['first_name'] = this.firstName;
    data['balance'] = this.balance;
    return data;
  }
}
