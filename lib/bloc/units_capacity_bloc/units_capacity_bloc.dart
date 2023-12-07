import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/data/models/units/units.dart';

part 'units_capacity_event.dart';
part 'units_capacity_state.dart';

class UnitsCapacityBloc extends Bloc<UnitsCapacityEvent, UnitsCapacityState> {
  final RemoteApi remoteApi;
  UnitsCapacityBloc({required this.remoteApi}) : super(UnitsInitial()) {
    on<UnitsCapacityEvent>((event, emit) async {
      if (event is GetUnitsCapacityEvent) {
        emit(LoadingDataState());
        final data = await remoteApi.fetchUnitsCapacityData(event.guest);
        emit(LoadedDataState(data: data));
      }
    });
  }
}
