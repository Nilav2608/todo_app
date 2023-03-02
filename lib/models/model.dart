class Task {
  int? id;
  String? taskTitle;
  bool? finished;

  userMap() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['taskTitle'] = taskTitle;
    mapping['finished'] = finished;
    return mapping;
  }
}
