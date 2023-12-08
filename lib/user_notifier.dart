import 'package:flutter/foundation.dart';
import 'user_model.dart';

class UserNotifier extends ValueNotifier<User> {
  UserNotifier(User value) : super(value);

  void updateUser(User newUser) {
    value = newUser;
    notifyListeners();
  }
}
