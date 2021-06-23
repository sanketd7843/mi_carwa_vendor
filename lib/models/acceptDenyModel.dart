class AppointmentModel {
  String name;
  String photo;
  String datedate;
  String address;
  String amount;

  AppointmentModel(
      this.name, this.datedate, this.photo, this.address, this.amount);
}

List<AppointmentModel> transactions = transactionData
    .map((item) => AppointmentModel(item['name'], item['photo'],
        item['datedate'], item['address'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Alex Gonsalvis",
    "photo": "assets/images/user_photo.png",
    "datedate": "15 Monday",
    "address": "6, Gondia, India",
    "amount": "210₹ "
  },
  {
    "name": "Bob Gonsalvis",
    "photo": "assets/images/user_photo.png",
    "datedate": "16 Monday",
    "address": "16, Nagpur, India",
    "amount": "210₹ "
  }
];
