import 'package:equatable/equatable.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_data_model.dart';

abstract class GymDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GymDataInitial extends GymDataState {}

class GymDataLoading extends GymDataState {}

class GymDataSuccess extends GymDataState {
  final GymDataModel gymDataModel;
  GymDataSuccess({required this.gymDataModel});
  @override
  List<Object?> get props => [gymDataModel];
}

class GymDataFail extends GymDataState {
  final CommonResponseModel commonResponseModel;
  GymDataFail({required this.commonResponseModel});
  @override
  List<Object?> get props => [commonResponseModel];
}
