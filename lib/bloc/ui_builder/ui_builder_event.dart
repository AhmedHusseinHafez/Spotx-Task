part of 'ui_builder_bloc.dart';

sealed class UiBuilderEvent extends Equatable {
  const UiBuilderEvent();

  @override
  List<Object> get props => [];
}
class GetUiBuildersEvent extends UiBuilderEvent {}