class TransactionModel {
  String name;
  String photo;
  String date;
  String contactNumber;
  String amount;
  String address;

  TransactionModel(this.name, this.contactNumber, this.photo, this.date,
      this.amount, this.address);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(item['name'], item['photo'],
        item['address'], item['contactNumber'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Rahul Raj",
    "photo": "assets/images/user_photo.png",
    "date": "4.1 / 5",
    "contactNumber": "9415125125",
    "address": "62,address, location",
    "amount": "35km "
  },
  {
    "name": "Arjun Dixit",
    "photo": "assets/images/user_photo.png",
    "date": "4.5 / 5",
    "contactNumber": "9457282225",
    "address": "62,address, location",
    "amount": "2km "
  },
  {
    "name": "Raj Dixit",
    "photo": "assets/images/user_photo.png",
    "date": "4.5 / 5",
    "contactNumber": "9457282225",
    "address": "62,address, location",
    "amount": "2km "
  },
  {
    "name": "Pan Car Services ",
    "photo": "assets/images/user_photo.png",
    "date": "4.5 / 5",
    "contactNumber": "9457282225",
    "address": "62,address, location",
    "amount": "2km "
  }
];
