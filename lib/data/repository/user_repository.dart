import 'dart:async';

import 'package:rxdart/subjects.dart';

import 'client/get_user.dart';

class UserRepository {
  UserRepository(): _userController = BehaviorSubject<User>();

  final StreamController<User> _userController;

  Future<void> fetchUser(String userId) async {
    final User user = await getUser(userId);
    _userController.add(user);
  }

  Stream<User> user() {
    return _userController.stream;
  }
}