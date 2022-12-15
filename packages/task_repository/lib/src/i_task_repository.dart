part of 'task_repository.dart';

/// An interface for TaskRepository
abstract class ITaskRepository {
  static const String collectionName = 'tasks';

  /// Stream of Tasks for current user from firebase
  Stream<NurseTasks> get tasks;

  /// Fetch but don't listen to tasks
  Future<NurseTasks> get tasksOneShot;

  /// Create task with [request] for current user
  TaskEither<String, bool> createTask(NurseTask request);

  /// Delete task that matches [request] for current user
  TaskEither<String, bool> deleteTask(NurseTask request);

  /// Update task that matches [request] for current user
  TaskEither<String, bool> updateTask(NurseTask request);
}
