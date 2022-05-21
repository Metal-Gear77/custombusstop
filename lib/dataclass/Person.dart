import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));
String personToJson(Person data) => json.encode(data.toJson());
class Person {
  Person({
      String? name1, 
      String? name2,}){
    _name1 = name1;
    _name2 = name2;
}

  Person.fromJson(dynamic json) {
    _name1 = json['name1'];
    _name2 = json['name2'];
  }
  String? _name1;
  String? _name2;
Person copyWith({  String? name1,
  String? name2,
}) => Person(  name1: name1 ?? _name1,
  name2: name2 ?? _name2,
);
  String? get name1 => _name1;
  String? get name2 => _name2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name1'] = _name1;
    map['name2'] = _name2;
    return map;
  }

}