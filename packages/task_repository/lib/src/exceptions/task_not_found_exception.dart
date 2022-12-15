class TaskNotFoundException implements Exception {
  @override
  String toString() {
    return 'Task does not exist';
  }
}
