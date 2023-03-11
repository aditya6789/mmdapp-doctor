class AppointmentModel {
  late String startTime;
  late String endTime;
  late int id;
  late String patientName;
  late int status;
  late String appointmentDate;

  AppointmentModel({
    required this.startTime,
    required this.endTime,
    required this.id,
    required this.patientName,
    required this.status,
    required this.appointmentDate,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      startTime: json['start_time'],
      endTime: json['end_time'],
      status: json['status'],
      appointmentDate: json['appointmentDate'],
      patientName: json['patient_name'],
      id: json['id'],
    );
  }
}
