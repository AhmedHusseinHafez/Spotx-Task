part of 'units_bloc.dart';

sealed class UnitsState extends Equatable {
  const UnitsState();

  @override
  List<Object> get props => [];
}

final class UnitsInitial extends UnitsState {}

class LoadingDataState extends UnitsState {}

class LoadedDataState extends UnitsState {
  final List<UnitsModel> data;
  const LoadedDataState({required this.data});

  @override
  List<Object> get props => [data];
}
