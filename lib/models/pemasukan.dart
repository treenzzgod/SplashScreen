class Item {
  int? _id;
  DateTime? _date;
  String? _description;
  int? _price;

  int get id => _id!;

  DateTime get date => _date!;
  set date(DateTime date) => _date = date;

  String get description => _description!;
  set description(String description) => _description = description;

  int get price => _price!;
  set price(int price) => _price = price;

  // Item(_date, _description, _pricet);
  Item(_description, _pricet);
  Item.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    // _date = DateTime.parse(map['date']);
    _description = map['description'];
    _price = map['price'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    // data['date'] = _date;
    data['description'] = _description;
    data['price'] = _price;
    return data;
  }
}
