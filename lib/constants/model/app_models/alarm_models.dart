class AlarmModel {
  String time;
  String date;
  bool isSwitchedOn;

  AlarmModel({
    required this.time,
    required this.date,
    //default it is on
    this.isSwitchedOn = true,
  });
}