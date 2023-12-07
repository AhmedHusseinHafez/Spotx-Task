import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/data/models/region_by_id/region_by_id.dart';

part 'region_id_bloc_event.dart';
part 'region_id_bloc_state.dart';

class RegionByIDBloc extends Bloc<RegionIDEvent, RegionByIDState> {
  final RemoteApi remoteApi;
  RegionByIDBloc({required this.remoteApi}) : super(DataBlocInitial()) {
    on<RegionIDEvent>((event, emit) async {
      if (event is GetRegionByIDEvent) {
        emit(LoadingRegionByIDState());
        final data = await remoteApi. fetchRegionDetailsData(regionId:  event.id );
        emit(LoadedRegionByIDState(data: data));
      }
    });
  }
}
