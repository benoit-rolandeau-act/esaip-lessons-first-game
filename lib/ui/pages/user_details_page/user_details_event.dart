import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show mustCallSuper;

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  @mustCallSuper
  List<Object?> get props => [];
}

class UserEditingEvent extends UserDetailsEvent {
  final String? firstName;
  final String? lastName;

  const UserEditingEvent({this.firstName, this.lastName});

  @override
  List<Object?> get props => [...super.props, firstName, lastName];
}

class UserSaveEvent extends UserDetailsEvent {
  const UserSaveEvent();
}

class UserCreateEvent extends UserDetailsEvent {
  const UserCreateEvent();
}
