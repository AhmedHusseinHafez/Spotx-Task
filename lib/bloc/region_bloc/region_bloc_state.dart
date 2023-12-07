part of 'region_bloc_bloc.dart';

abstract class RegionState extends Equatable {
  const RegionState();

  @override
  List<Object> get props => [];
}

final class DataBlocInitial extends RegionState {}

class LoadingDataState extends RegionState {}

class LoadedDataState extends RegionState {
  final List<RegionModel> data;

  const LoadedDataState({required this.data});

  @override
  List<Object> get props => [data];
}
