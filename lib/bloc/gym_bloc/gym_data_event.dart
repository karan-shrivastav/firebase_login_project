import 'package:equatable/equatable.dart';

abstract class GymDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GymDataDetails extends GymDataEvent {
  final Map<String, dynamic> body;
  GymDataDetails({
    required this.body,
  });
  @override
  List<Object?> get props => [body];
}

