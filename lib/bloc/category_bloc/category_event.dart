import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryDetails extends CategoryEvent {
  final Map<String, dynamic> body;
  CategoryDetails({
    required this.body,
  });
  @override
  List<Object?> get props => [body];
}

