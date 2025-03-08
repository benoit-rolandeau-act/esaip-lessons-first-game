import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ATestModel extends Equatable {
  final bool propertyOne;

  final int? secondValue;

  const ATestModel({
    required this.propertyOne,
    required this.secondValue,
  });

  ATestModel copyWith({
    bool? propertyOne,
    int? secondValue,
    bool forceSecondValue = false,
  }) =>
      ATestModel(
        propertyOne: propertyOne ?? this.propertyOne,
        secondValue:
            secondValue ?? (forceSecondValue ? null : this.secondValue),
      );

  @override
  @mustCallSuper
  List<Object?> get props => [propertyOne, secondValue];
}
