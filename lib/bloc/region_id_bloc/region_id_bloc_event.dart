part of 'region_id_bloc_bloc.dart';

abstract class RegionIDEvent extends Equatable {
  const RegionIDEvent();

  @override
  List<Object> get props => [];
}

class GetRegionByIDEvent extends RegionIDEvent {
  final int id;
   const GetRegionByIDEvent({required this.id});
}
