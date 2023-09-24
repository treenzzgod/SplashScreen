class Pemasukan {
  int _id;
  DateTime _date;
  String _description;
  int _amount;

  int get id => _id;

  DateTime get date => _date;
  set date(DateTime date) => _date = date;

  String get description => _description;
  set description(String description) => _description = description;

  int get amount => _amount;
  set amount(int amount) => _amount = amount;

  Pemasukan(_id, _date, _description, _amount);

  Pemasukan.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _date = DateTime.parse(map['date']);
    _description = map['description'];
    _amount = map['amount'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['date'] = _date;
    data['description'] = _description;
    data['amount'] = _amount;
    return data;
  }
}
