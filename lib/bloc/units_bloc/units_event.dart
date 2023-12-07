part of 'units_bloc.dart';

sealed class UnitsEvent extends Equatable {
  const UnitsEvent();

  @override
  List<Object> get props => [];
}
class GetUnitsEvent extends UnitsEvent {}