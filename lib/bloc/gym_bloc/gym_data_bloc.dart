import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../models/common_respone_model.dart';
import '../../models/gym_data_model.dart';
import '../../services/api_services.dart';
import 'gym_data_event.dart';
import 'gym_data_state.dart';

class GymDataBloc extends Bloc<GymDataEvent, GymDataState> {
  ApiService apiService = ApiService();
  GymDataModel gymDataModel = GymDataModel();
  late CommonResponseModel? commonResponseModel;

  GymDataBloc() : super(GymDataInitial()) {
    on<GymDataDetails>((event, emit) async {
      try {
        emit(GymDataLoading());
        final response = await apiService.apiCallTypePost(
            'customer/gymList',
            body: event.body);
        // print('***********************************');
        // print(event.body);
        // print('***********************************');
        if (kDebugMode) {
          print(("Data ${response.body}"));
        }
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          if (responseData['status'] == true) {
            // ToastAlert(responseData["message"]);
            gymDataModel = GymDataModel.fromJson(responseData);
            print('***********************************************');
            print(gymDataModel);
            print('***************************************************');
            emit(GymDataSuccess(gymDataModel: gymDataModel));
          } else {
            commonResponseModel = const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong');
            emit(GymDataFail(
                commonResponseModel: const CommonResponseModel(
                    statusCode: 400, message: 'Something went wrong')));
          }
        } else {
          final Map<String, dynamic> responseData = json.decode(response.body);
          //  ToastAlert(responseData["message"]);
          emit(GymDataFail(
              commonResponseModel: CommonResponseModel(
                  statusCode: 400, message: responseData["message"])));
        }
      } catch (err) {
        emit(GymDataFail(
            commonResponseModel: const CommonResponseModel(
                statusCode: 400, message: 'Something went wrong')));
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }
}
