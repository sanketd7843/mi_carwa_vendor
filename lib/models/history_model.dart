class HistoryModel {
  String name;
  String photo;
  String date;
  String day;
  String amount;

  HistoryModel(this.name, this.photo, this.day, this.date, this.amount);
}

List<HistoryModel> transactions = transactionData
    .map((item) => HistoryModel(
        item['name'], item['day'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Alex Car Services",
    "photo": "assets/images/user_photo.png",
    "date": "14",
    "day": "Thursday",
    "amount": "350₹ "
  },
  {
    "name": "Bob Car Services",
    "photo": "assets/images/user_photo.png",
    "date": "25",
    "day": "Saturday",
    "amount": "100₹ "
  },
  {
    "name": "Pan Car Services ",
    "photo": "assets/images/user_photo.png",
    "date": "05",
    "day": "Monday",
    "amount": "210₹ "
  }
];
