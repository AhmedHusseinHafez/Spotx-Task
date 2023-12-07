part of 'units_capacity_bloc.dart';

sealed class UnitsCapacityState extends Equatable {
  const UnitsCapacityState();

  @override
  List<Object> get props => [];
}

final class UnitsInitial extends UnitsCapacityState {}

class LoadingDataState extends UnitsCapacityState {}

class LoadedDataState extends UnitsCapacityState {
  final List<UnitsModel> data;
  const LoadedDataState({required this.data});

  @override
  List<Object> get props => [data];
}
