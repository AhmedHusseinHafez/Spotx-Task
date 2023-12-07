import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotx/data/remote_data_source/remote_data_source.dart';
import 'package:spotx/data/models/ui_builder/ui_builder_model.dart';

part 'ui_builder_event.dart';
part 'ui_builder_state.dart';

class UiBuilderBloc extends Bloc<UiBuilderEvent, UiBuilderState> {
  final RemoteApi remoteApi;
  UiBuilderBloc({required this.remoteApi}) : super(UiBuilderInitial()) {
    on<UiBuilderEvent>((event, emit) async {
      if (event is GetUiBuildersEvent) {
        emit(LoadingUiBuilderState());
        final uibuilderdata = await remoteApi.getUiBuilders();
        emit(LoadedUiBuilderState(uiBuilder: uibuilderdata));
      }
    });
  }
}
