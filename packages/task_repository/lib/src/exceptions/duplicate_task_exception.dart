class DuplicateTaskException implements Exception {
  @override
  String toString() {
    return 'Task already exists';
  }
}
