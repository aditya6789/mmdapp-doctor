class PatientsModel {
  late List img;
  late List title;
  late List day;
  late List number;

  PatientsModel({
    required this.img,
    required this.title,
    required this.day,
    required this.number,
  });
}

class TodaysModel {
  late List date;
  late List name;
  late List time;
  late List type;

  TodaysModel({
    required this.date,
    required this.name,
    required this.time,
    required this.type,
  });
}
