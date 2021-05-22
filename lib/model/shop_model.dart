class AppointmentModel {
  String name;
  String photo;
  String date;
  String day;
  String amount;

  AppointmentModel(this.name, this.day, this.photo, this.date, this.amount);
}

List<AppointmentModel> transactions = transactionData
    .map((item) => AppointmentModel(
        item['name'], item['photo'], item['day'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Alex Car Services",
    "photo": "assets/images/user_photo.png",
    "date": "15",
    "day": "Monday",
    "amount": "210₹ "
  },
  {
    "name": "Bob Car Services",
    "photo": "assets/images/user_photo.png",
    "date": "25",
    "day": "Thursday",
    "amount": "210₹ "
  },
  {
    "name": "Pan Car Services ",
    "photo": "assets/images/user_photo.png",
    "date": "01",
    "day": "Sunday",
    "amount": "210₹ "
  }
];
