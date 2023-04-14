class Task {
  Task(this.title, {this.description = '', this.done = false});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    done = json['done'];
  }

  late final String title;
  late final String description;
  late bool done;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'done': done,
    };
  }
}
