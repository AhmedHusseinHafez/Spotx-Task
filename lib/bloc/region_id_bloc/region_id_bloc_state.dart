part of 'region_id_bloc_bloc.dart';

abstract class RegionByIDState extends Equatable {
  const RegionByIDState();

  @override
  List<Object> get props => [];
}

final class DataBlocInitial extends RegionByIDState {}

class LoadingRegionByIDState extends RegionByIDState {}

class LoadedRegionByIDState extends RegionByIDState {
  final List<RegionByIDModel> data;
  const LoadedRegionByIDState({required this.data});
  @override
  List<Object> get props => [data];
}
