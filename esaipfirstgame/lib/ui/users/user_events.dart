import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  @mustCallSuper
  List<Object?> get props => [];
}

class ButtonClickEvent extends UserEvent {
  final bool isGreen;

  const ButtonClickEvent({
    required this.isGreen,
  });

  @override
  List<Object?> get props => [...super.props, isGreen];
}
