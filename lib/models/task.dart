class Task {
  final int? id;
  final String title;
  final DateTime dueDate;
  final String description;
  final bool isCompleted;
  final int priority;
  final DateTime createdAt;
  final DateTime updatedAt;

  Task({
    this.id,
    required this.title,
    required this.dueDate,
    required this.description,
    this.isCompleted = false,
    this.priority = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };

    final taskId = id;
    if (taskId != null) {
      map['id'] = taskId;
    }

    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      dueDate: DateTime.parse(map['dueDate']),
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      priority: map['priority'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
