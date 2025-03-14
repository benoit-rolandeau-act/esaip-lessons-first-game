import 'dart:async';

import 'package:flutter_application_1/managers/abstract_manager.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UsersManager extends AbstractManager {
  final List<UserModel> _users;

  StreamController<void> _usersUpdatedController;

  Stream<void> get usersUpdatedStream => _usersUpdatedController.stream;

  UsersManager()
    : _users = [
        UserModel(id: 1, firstName: "Bertrand", lastName: "Lionel"),
        UserModel(id: 2, firstName: "Olivier", lastName: "Gerard"),
      ],
      _usersUpdatedController = StreamController<void>.broadcast();

  @override
  Future<void> init() async {}

  Future<List<UserModel>> getUsers() async {
    await Future.delayed(const Duration(seconds: 5));
    return List.from(_users);
  }

  Future<UserModel> createUser(UserModel user) async {
    final newUser = user.copyWith(id: (_users.lastOrNull?.id ?? 0) + 1);
    _users.add(newUser);
    _usersUpdatedController.add(null);
    return newUser;
  }

  Future<UserModel?> updateUser(UserModel user) async {
    final index = _users.indexWhere((element) => element.id == user.id);
    if (index == -1) {
      print("User not found: ${user.id}");
      return null;
    }

    _users[index] = user;
    _usersUpdatedController.add(null);
    return user;
  }

  Future<void> deleteUser(int userId) async {
    _users.removeWhere((element) => element.id == userId);
    _usersUpdatedController.add(null);
  }

  @override
  Future<void> dispose() async {
    await _usersUpdatedController.close();
  }
}
