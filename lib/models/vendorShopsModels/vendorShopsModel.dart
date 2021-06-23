class vendorShopsModel {
  String response;
  String message;
  List<VendorShopData> data;

  vendorShopsModel({this.response, this.message, this.data});

  vendorShopsModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<VendorShopData>();
      json['data'].forEach((v) {
        data.add(new VendorShopData.fromJson(v));
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

class VendorShopData {
  int id;
  int vendorId;
  String shopName;
  String shopDescription;
  String shopAddress;
  double shopLattitude;
  double shopLongitude;
  String shopContactNumber;
  String openingTime;
  String closingTime;
  int shopStatus;
  String createdAt;
  String updatedAt;

  VendorShopData(
      {this.id,
      this.vendorId,
      this.shopName,
      this.shopDescription,
      this.shopAddress,
      this.shopLattitude,
      this.shopLongitude,
      this.shopContactNumber,
      this.openingTime,
      this.closingTime,
      this.shopStatus,
      this.createdAt,
      this.updatedAt});

  VendorShopData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    shopName = json['shop_name'];
    shopDescription = json['shop_description'];
    shopAddress = json['shop_address'];
    shopLattitude = json['shop_lattitude'];
    shopLongitude = json['shop_longitude'];
    shopContactNumber = json['shop_contact_number'];

    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    shopStatus = json['shop_status'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['shop_name'] = this.shopName;
    data['shop_description'] = this.shopDescription;
    data['shop_address'] = this.shopAddress;
    data['shop_lattitude'] = this.shopLattitude;
    data['shop_longitude'] = this.shopLongitude;
    data['shop_contact_number'] = this.shopContactNumber;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['shop_status'] = this.shopStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
