import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/data/models/units/units.dart';

part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  final RemoteApi remoteApi;
  UnitsBloc({required this.remoteApi}) : super(UnitsInitial()) {
    on<UnitsEvent>((event, emit) async {
      if (event is GetUnitsEvent) {
        emit(LoadingDataState());
        final data = await remoteApi.fetchUnitsData();
        emit(LoadedDataState(data: data));
      }
    });
  }
}
