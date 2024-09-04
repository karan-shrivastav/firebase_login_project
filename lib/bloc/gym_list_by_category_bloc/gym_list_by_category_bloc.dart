import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_list_by_category_model.dart';
import '../../services/api_services.dart';
import 'gym_list_by_category_event.dart';
import 'gym_list_by_category_state.dart';

class GymListByCategoryBloc extends Bloc<GymListByCategoryEvent, GymListByCategoryState> {
  ApiService apiService = ApiService();
  GymListByCategoryModel gymListByCategoryModel = GymListByCategoryModel();
  late CommonResponseModel? commonResponseModel;

  GymListByCategoryBloc() : super(GymListByCategoryInitial()) {
    on<GymListByCategoryDetails>((event, emit) async {
      try {
        emit(GymListByCategoryLoading());
        final response = await apiService
            .apiCallTypePost('customer/gymListByCategory', body: event.body);
        print('GymListByCategory ***********************************');
        print(event.body);
        print('***********************************');
        if (kDebugMode) {
          print(("Data ${response.body}"));
        }
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          if (responseData['status'] == true) {
            // ToastAlert(responseData["message"]);
            gymListByCategoryModel = GymListByCategoryModel.fromJson(responseData);
            print('***********************************************');
            print(gymListByCategoryModel);
            print('***************************************************');
            emit(GymListByCategorySuccess(gymListByCategoryModel: gymListByCategoryModel));
          } else {
            commonResponseModel = const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong');
            emit(GymListByCategoryFail(
                commonResponseModel: const CommonResponseModel(
                    statusCode: 400, message: 'Something went wrong')));
          }
        } else {
          final Map<String, dynamic> responseData = json.decode(response.body);
          //  ToastAlert(responseData["message"]);
          emit(GymListByCategoryFail(
              commonResponseModel: CommonResponseModel(
                  statusCode: 400, message: responseData["message"])));
        }
      } catch (err) {
        emit(GymListByCategoryFail(
            commonResponseModel: const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong')));
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }
}
