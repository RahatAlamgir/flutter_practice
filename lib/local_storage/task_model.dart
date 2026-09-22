class TaskModel {
  final String? title;
  final String? description;
  final bool isDone;

  TaskModel({this.title, this.description, this.isDone = false});

  TaskModel copyWith({String? title, String? description, bool? isDone}) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'isDone': isDone,
  };
}
