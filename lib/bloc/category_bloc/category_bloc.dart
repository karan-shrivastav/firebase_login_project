import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_category_model.dart';
import '../../services/api_services.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  ApiService apiService = ApiService();
  GymCategoryModel gymCategoryModel = GymCategoryModel();
  late CommonResponseModel? commonResponseModel;

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryDetails>((event, emit) async {
      try {
        emit(CategoryLoading());
        final response = await apiService
            .apiCallTypePost('partner/categories/list', body: event.body);
        print('Category ***********************************');
        print(event.body);
        print('***********************************');
        if (kDebugMode) {
          print(("Data ${response.body}"));
        }
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          if (responseData['status'] == true) {
            // ToastAlert(responseData["message"]);
            gymCategoryModel = GymCategoryModel.fromJson(responseData);
            print('***********************************************');
            print(gymCategoryModel);
            print('***************************************************');
            emit(CategorySuccess(gymCategoryModel: gymCategoryModel));
          } else {
            commonResponseModel = const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong');
            emit(CategoryFail(
                commonResponseModel: const CommonResponseModel(
                    statusCode: 400, message: 'Something went wrong')));
          }
        } else {
          final Map<String, dynamic> responseData = json.decode(response.body);
          //  ToastAlert(responseData["message"]);
          emit(CategoryFail(
              commonResponseModel: CommonResponseModel(
                  statusCode: 400, message: responseData["message"])));
        }
      } catch (err) {
        emit(CategoryFail(
            commonResponseModel: const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong')));
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }
}
