class userMakeOrderModel {
  String response;
  String message;
  List<UserMakeOrderData> data;

  userMakeOrderModel({this.response, this.message, this.data});

  userMakeOrderModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<UserMakeOrderData>();
      json['data'].forEach((v) {
        data.add(new UserMakeOrderData.fromJson(v));
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

class UserMakeOrderData {
  String userId;
  String shopId;
  String vendorId;
  String packageId;
  String appointmentDate;
  String updatedAt;
  String createdAt;
  int id;

  UserMakeOrderData(
      {this.userId,
      this.shopId,
      this.vendorId,
      this.packageId,
      this.appointmentDate,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserMakeOrderData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    shopId = json['shop_id'];
    vendorId = json['vendor_id'];
    packageId = json['package_id'];
    appointmentDate = json['appointment_date'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['vendor_id'] = this.vendorId;
    data['package_id'] = this.packageId;
    data['appointment_date'] = this.appointmentDate;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
