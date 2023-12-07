part of 'ui_builder_bloc.dart';

sealed class UiBuilderState extends Equatable {
  const UiBuilderState();
  
  @override
  List<Object> get props => [];
}

final class UiBuilderInitial extends UiBuilderState {}

class LoadingUiBuilderState extends UiBuilderState {}

class LoadedUiBuilderState extends UiBuilderState {
  final List<UiBuilderModel> uiBuilder;

  const LoadedUiBuilderState({required this.uiBuilder});

  @override
  List<Object> get props => [uiBuilder];
}
