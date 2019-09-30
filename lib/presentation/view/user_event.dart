import '../ui_event.dart';

class UserSearchEvent extends UIEvent {
  UserSearchEvent(this.userId);

  final String userId;
}