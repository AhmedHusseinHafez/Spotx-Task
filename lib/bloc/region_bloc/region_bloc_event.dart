part of 'region_bloc_bloc.dart';

abstract class RegionEvent extends Equatable {
  const RegionEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends RegionEvent {}
