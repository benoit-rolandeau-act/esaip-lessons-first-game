import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  const UserModel({required this.id, required this.firstName, required this.lastName});

  const UserModel.add({required this.firstName, required this.lastName}) : id = -1;

  UserModel copyWith({int? id, String? firstName, String? lastName}) => UserModel(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
  );

  @override
  List<Object?> get props => [id, firstName, lastName];
}
