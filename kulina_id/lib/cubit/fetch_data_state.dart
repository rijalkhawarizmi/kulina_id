part of 'fetch_data_cubit.dart';

@immutable
abstract class FetchDataState {}

class FetchDataInitial extends FetchDataState {}
class FetchDataLoading extends FetchDataState {}
class FetchDataSuccess extends FetchDataState {
  final DataModel? dataModel;
  FetchDataSuccess({this.dataModel});
}
class FetchDataFailed extends FetchDataState {
  final String messageError;
  FetchDataFailed(this.messageError);
}
