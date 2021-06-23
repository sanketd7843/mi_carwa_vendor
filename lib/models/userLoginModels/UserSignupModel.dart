class UserSignupModel {
  String response;
  String message;
  List<Data> data;

  UserSignupModel({this.response, this.message, this.data});

  UserSignupModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String email;
  String firstname;
  String middlename;
  String lastname;
  String dateOfBirth;
  String panNo;
  String panImage;
  String aadhaarNo;
  String aadhaarImage;
  String occupation;
  String referenceCode;
  String sponsorCode;
  String sponsorName;
  String password;
  String joinedAt;
  String updatedAt;
  String createdAt;

  Data(
      {this.id,
      this.email,
      this.firstname,
      this.middlename,
      this.lastname,
      this.dateOfBirth,
      this.panNo,
      this.panImage,
      this.aadhaarNo,
      this.aadhaarImage,
      this.occupation,
      this.referenceCode,
      this.sponsorCode,
      this.sponsorName,
      this.password,
      this.joinedAt,
      this.updatedAt,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstname = json['firstname'];
    middlename = json['middlename'];
    lastname = json['lastname'];
    dateOfBirth = json['date_of_birth'];
    panNo = json['pan_no'];
    panImage = json['pan_image'];
    aadhaarNo = json['aadhaar_no'];
    aadhaarImage = json['aadhaar_image'];
    occupation = json['occupation'];
    referenceCode = json['reference_code'];
    sponsorCode = json['sponsor_code'];
    sponsorName = json['sponsor_name'];
    password = json['password'];
    joinedAt = json['joined_at'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['middlename'] = this.middlename;
    data['lastname'] = this.lastname;
    data['date_of_birth'] = this.dateOfBirth;
    data['pan_no'] = this.panNo;
    data['pan_image'] = this.panImage;
    data['aadhaar_no'] = this.aadhaarNo;
    data['aadhaar_image'] = this.aadhaarImage;
    data['occupation'] = this.occupation;
    data['reference_code'] = this.referenceCode;
    data['sponsor_code'] = this.sponsorCode;
    data['sponsor_name'] = this.sponsorName;
    data['password'] = this.password;
    data['joined_at'] = this.joinedAt;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
