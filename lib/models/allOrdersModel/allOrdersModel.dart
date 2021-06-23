class allOrdersModel {
  String response;
  String message;
  List<AllOrdersData> data;

  allOrdersModel({this.response, this.message, this.data});

  allOrdersModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<AllOrdersData>();
      json['data'].forEach((v) {
        data.add(new AllOrdersData.fromJson(v));
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

class AllOrdersData {
  int id;
  int userId;
  int shopId;
  int vendorId;
  int packageId;
  String appointmentDate;
  int orderStatus;
  String cancellationReason;
  String createdAt;
  String updatedAt;
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

  AllOrdersData(
      {this.id,
      this.userId,
      this.shopId,
      this.vendorId,
      this.packageId,
      this.appointmentDate,
      this.orderStatus,
      this.cancellationReason,
      this.createdAt,
      this.updatedAt,
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
      this.joinedAt});

  AllOrdersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    vendorId = json['vendor_id'];
    packageId = json['package_id'];
    appointmentDate = json['appointment_date'];
    orderStatus = json['order_status'];
    cancellationReason = json['cancellation_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['vendor_id'] = this.vendorId;
    data['package_id'] = this.packageId;
    data['appointment_date'] = this.appointmentDate;
    data['order_status'] = this.orderStatus;
    data['cancellation_reason'] = this.cancellationReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    return data;
  }
}
