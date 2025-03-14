import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UsersState extends Equatable {
  final List<UserModel>? users;
  final bool loading;

  const UsersState({required this.users, required this.loading});

  const UsersState.initial() : users = null, loading = true;

  UsersState copyWith({List<UserModel>? users, bool? loading}) =>
      UsersState(users: users ?? this.users, loading: loading ?? this.loading);

  @override
  List<Object?> get props => [users, loading];
}
