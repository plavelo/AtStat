import 'dart:async';

import '../../data/repository/client/get_user.dart';
import '../../data/repository/user_repository.dart';
import '../bloc.dart';
import '../ui_event.dart';
import 'user_event.dart';

class UserBloc extends Bloc {
  UserBloc(this._userRepository)
  : _eventController = StreamController<UIEvent>.broadcast() {
    _eventController.stream.listen((UIEvent event) async {
      if (event is UserSearchEvent) {
        await _userRepository.fetchUser(event.userId);
      }
    });
  }

  final UserRepository _userRepository;
  final StreamController<UIEvent> _eventController;

  StreamSink<UIEvent> get eventSink => _eventController.sink;
  Stream<User> get user {
    return _userRepository.user();
  }

  @override
  Future<void> dispose() async {
    await _eventController.close();
  }

  @override
  Future<void> init() async {}
}
