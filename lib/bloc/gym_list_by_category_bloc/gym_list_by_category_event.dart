import 'package:equatable/equatable.dart';

abstract class GymListByCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GymListByCategoryDetails extends GymListByCategoryEvent {
  final Map<String, dynamic> body;
  GymListByCategoryDetails({
    required this.body,
  });
  @override
  List<Object?> get props => [body];
}

