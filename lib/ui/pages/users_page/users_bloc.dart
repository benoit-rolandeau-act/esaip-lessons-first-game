import 'dart:async';

import 'package:flutter_application_1/managers/global_manager.dart';
import 'package:flutter_application_1/managers/users_manager.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_event.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersManager _usersManager;
  StreamSubscription? _usersUpdatedSubscription;

  UsersBloc()
    : _usersManager = GlobalManager.instance.usersManager,
      super(const UsersState.initial()) {
    on<GetUsersEvent>(_onGetUsersEvent);
    on<UsersDeleteUserEvent>(_onDeleteUserEvent);

    _usersUpdatedSubscription = _usersManager.usersUpdatedStream.listen(
      (_) => add(const GetUsersEvent()),
    );

    add(const GetUsersEvent());
  }

  Future<void> _onGetUsersEvent(GetUsersEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(loading: true));
    final users = await _usersManager.getUsers();
    emit(state.copyWith(users: users, loading: false));
  }

  Future<void> _onDeleteUserEvent(UsersDeleteUserEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(loading: true));
    await _usersManager.deleteUser(event.userId);
    emit(state.copyWith(loading: false));
  }

  @override
  Future<void> close() async {
    await _usersUpdatedSubscription?.cancel();
    return super.close();
  }
}
