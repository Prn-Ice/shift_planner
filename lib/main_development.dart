// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// Package imports:
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/bootstrap.dart';
import 'firebase_options_dev.dart';

void main() {
  bootstrap(
    App.new,
    firebaseInitializer: () async => Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  );
}
