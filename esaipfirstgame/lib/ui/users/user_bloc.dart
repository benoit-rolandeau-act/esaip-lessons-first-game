import 'package:esaipfirstgame/ui/users/user_events.dart';
import 'package:esaipfirstgame/ui/users/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.init()) {
    on<ButtonClickEvent>(_onButtonClickEvent);
  }

  Future<void> _onButtonClickEvent(
    ButtonClickEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isGreen: event.isGreen));
  }
}
