import 'package:flutter_application_1/managers/global_manager.dart';
import 'package:flutter_application_1/managers/users_manager.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_event.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UsersManager _usersManager;

  UserDetailsBloc({required UserModel? user})
    : _usersManager = GlobalManager.instance.usersManager,
      super(UserDetailsState.initial(user: user)) {
    on<UserEditingEvent>(_onUserEditingEvent);
    on<UserSaveEvent>(_onUserSaveEvent);
    on<UserCreateEvent>(_onUserCreateEvent);
  }

  Future<void> _onUserEditingEvent(UserEditingEvent event, Emitter<UserDetailsState> emit) async {
    emit(
      state.copyWith(
        user:
            state.user?.copyWith(firstName: event.firstName, lastName: event.lastName) ??
            UserModel.add(firstName: event.firstName ?? "", lastName: event.lastName ?? ""),
      ),
    );
  }

  Future<void> _onUserSaveEvent(UserSaveEvent event, Emitter<UserDetailsState> emit) async {
    emit(state.copyWithLoadingState());
    if (state.user == null) {
      emit(state.copyWithErrorState());
      return;
    }

    final user = await _usersManager.updateUser(state.user!);
    if (user == null) {
      emit(state.copyWith(hasAnError: true, loading: false));
      return;
    }

    emit(state.copyWith(user: user, loading: false));
  }

  Future<void> _onUserCreateEvent(UserCreateEvent event, Emitter<UserDetailsState> emit) async {
    emit(state.copyWithLoadingState());
    if (state.user == null) {
      emit(state.copyWithErrorState());
      return;
    }

    final user = await _usersManager.createUser(state.user!);
    emit(state.copyWith(user: user, loading: false));
  }
}
