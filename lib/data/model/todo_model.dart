class ToDoModel {
  final String? title;
  final String? description;
  final String? status;
  final DateTime dueDate;

  ToDoModel(
      {required this.title,
      required this.description,
      required this.status,
      required this.dueDate});

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        title: json["title"],
        description: json["description"],
        status: json["status"],
        dueDate: json["dueDate"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "status": status,
        "dueDate": dueDate,
      };
}
