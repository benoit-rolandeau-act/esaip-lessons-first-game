import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserDetailsState extends Equatable {
  final bool loading;
  final bool hasAnError;
  final UserModel? user;

  const UserDetailsState({required this.loading, required this.hasAnError, required this.user});

  const UserDetailsState.initial({required this.user}) : loading = false, hasAnError = false;

  UserDetailsState copyWith({
    bool? loading,
    UserModel? user,
    bool forceUser = false,
    bool? hasAnError,
  }) => UserDetailsState(
    loading: loading ?? this.loading,
    hasAnError: hasAnError ?? this.hasAnError,
    user: user ?? (forceUser ? null : this.user),
  );

  UserDetailsState copyWithLoadingState() => copyWith(loading: true, hasAnError: false);

  UserDetailsState copyWithErrorState() => copyWith(loading: false, hasAnError: true);

  @override
  List<Object?> get props => [loading, hasAnError, user];
}
