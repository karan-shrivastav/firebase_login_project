import 'package:equatable/equatable.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_list_by_category_model.dart';

abstract class GymListByCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GymListByCategoryInitial extends GymListByCategoryState {}

class GymListByCategoryLoading extends GymListByCategoryState {}

class GymListByCategorySuccess extends GymListByCategoryState {
  final GymListByCategoryModel gymListByCategoryModel;
  GymListByCategorySuccess({required this.gymListByCategoryModel});
  @override
  List<Object?> get props => [gymListByCategoryModel];
}

class GymListByCategoryFail extends GymListByCategoryState {
  final CommonResponseModel commonResponseModel;
  GymListByCategoryFail({required this.commonResponseModel});
  @override
  List<Object?> get props => [commonResponseModel];
}
