import 'package:bloc/bloc.dart';
import 'package:kulina_id/model.dart';
import 'package:kulina_id/services.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  ServiceApi _services = ServiceApi();

  void fetchData() async {
    emit(FetchDataLoading());
    try {
      Response list = await _services.getGuest();
      if (_services.response?.statusCode == 200) {
        emit(FetchDataSuccess(dataModel: DataModel.fromJson(list.data)));
      } else {
        emit(FetchDataFailed('Failed to load data'));
      }
    } catch (e) {
       emit(FetchDataFailed('There something wrong'));
    }
  }
}
