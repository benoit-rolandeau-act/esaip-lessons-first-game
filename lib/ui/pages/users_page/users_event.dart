import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  @mustCallSuper
  List<Object?> get props => [];
}

class GetUsersEvent extends UsersEvent {
  const GetUsersEvent();
}

class UsersDeleteUserEvent extends UsersEvent {
  final int userId;

  const UsersDeleteUserEvent(this.userId);

  @override
  List<Object?> get props => [...super.props, userId];
}
