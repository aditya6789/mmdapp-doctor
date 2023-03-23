class DoctorTagModel {
  late String tag;
  late String id;

  DoctorTagModel({
    required this.id,
    required this.tag,
  });

  factory DoctorTagModel.fromJson(Map<String, dynamic> json) {
    return DoctorTagModel(
      id: json['id'],
      tag: json['tag'],
    );
  }
}
