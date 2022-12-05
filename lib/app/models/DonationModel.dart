class DonationModel {
  String? accountNumber;
  String? firstName;
  String? asset;
  String? lastName;
  String? sortCode;
  String? name;
  String? desc;

  DonationModel(
      {this.accountNumber,
      this.firstName,
      this.asset,
      this.lastName,
      this.sortCode,
      this.name,
      this.desc});

  DonationModel.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    firstName = json['first_name'];
    asset = json['asset'];
    lastName = json['last_name'];
    sortCode = json['sort_code'];
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_number'] = this.accountNumber;
    data['first_name'] = this.firstName;
    data['asset'] = this.asset;
    data['last_name'] = this.lastName;
    data['sort_code'] = this.sortCode;
    data['name'] = this.name;
    data['desc'] = this.desc;
    return data;
  }
}
