import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/data/models/region/region.dart';

part 'region_bloc_event.dart';
part 'region_bloc_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final RemoteApi remoteApi;
  RegionBloc({required this.remoteApi}) : super(DataBlocInitial()) {
    on<RegionEvent>((event, emit) async {
      if (event is GetDataEvent) {
        emit(LoadingDataState());
        final data = await remoteApi.fetchRegionData();
        emit(LoadedDataState(data: data));
      }
    });
  }
}
