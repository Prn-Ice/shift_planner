// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "email": "Email",
  "password": "Password",
  "date": "Date",
  "time": "Time",
  "counter": {
    "appBarTitle": "Counter"
  },
  "appName": "Shift Planner",
  "by": "Powered By",
  "register": {
    "welcome": "Welcome to Shift Planner",
    "register": "Register",
    "loginInstead": "Login instead"
  },
  "login": {
    "welcome": "Welcome back",
    "login": "Login",
    "registerInstead": "Register instead"
  },
  "dashboard": {
    "today": "Today",
    "all": "All",
    "completed": "Completed",
    "title": "Title",
    "shift": "Shift",
    "addTask": "Add Task",
    "addTaskSuccess": "Task added successfully",
    "edit": "Edit",
    "delete": "Delete",
    "deleteConfirmation": "Are you sure you want to delete this task?",
    "save": "Save"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
