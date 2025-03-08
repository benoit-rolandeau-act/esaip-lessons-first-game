import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final bool isGreen;

  const UserState({
    required this.isGreen,
  });

  const UserState.init() : isGreen = false;

  UserState copyWith({
    bool? isGreen,
  }) =>
      UserState(
        isGreen: isGreen ?? this.isGreen,
      );

  @override
  List<Object?> get props => [isGreen];
}
