class TaskModel {
  final String name;
  final String desc;
  final String startDate;
  final String endDate;
  final String priority;
  final bool alert;
  TaskModel(
      {required this.name,
      required this.desc,
      required this.startDate,
      required this.endDate,
      required this.priority,
      required this.alert});
}
