// class AlarmModel {
//   String? label;
//   String? dateTime;
//   String? alarmDate;
//   bool check;
//   String? when;
//   int? id;
//   int? milliseconds;

//   AlarmModel({
//     required this.label,
//     required this.dateTime,
//     required this.alarmDate,
//     required this.check,
//     required this.when,
//     required this.id,
//     required this.milliseconds,
//   });

//   factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
//         label: json["label"],
//         dateTime: json["dateTime"],
//         alarmDate: json["alarmDate"],
//         check: json["check"],
//         when: json["when"],
//         id: json["id"],
//         milliseconds: json["milliseconds"],
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "dateTime": dateTime,
//         "alarmDate": alarmDate,
//         "check": check,
//         "when": when,
//         "id": id,
//         "milliseconds": milliseconds,
//       };
// }
