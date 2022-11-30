class UserModel {
  String? firstName;
  String? lastName;
  String? uniqueId;
  String? password;
  Contact? contact;

  UserModel(
      {this.firstName,
      this.lastName,
      this.uniqueId,
      this.password,
      this.contact});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    uniqueId = json['unique_id'];
    password = json['password'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['unique_id'] = this.uniqueId;
    data['password'] = this.password;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Contact {
  String? contactType;
  String? firstName;
  String? lastName;
  String? email;
  String? country;
  String? nationality;
  String? dateOfBirth;

  Contact(
      {this.contactType,
      this.firstName,
      this.lastName,
      this.email,
      this.country,
      this.nationality,
      this.dateOfBirth});

  Contact.fromJson(Map<String, dynamic> json) {
    contactType = json['contact_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    country = json['country'];
    nationality = json['nationality'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_type'] = this.contactType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country'] = this.country;
    data['nationality'] = this.nationality;
    data['date_of_birth'] = this.dateOfBirth;
    return data;
  }
}
