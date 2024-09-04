import 'package:equatable/equatable.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_category_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final GymCategoryModel gymCategoryModel;
  CategorySuccess({required this.gymCategoryModel});
  @override
  List<Object?> get props => [gymCategoryModel];
}

class CategoryFail extends CategoryState {
  final CommonResponseModel commonResponseModel;
  CategoryFail({required this.commonResponseModel});
  @override
  List<Object?> get props => [commonResponseModel];
}
