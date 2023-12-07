part of 'units_capacity_bloc.dart';

sealed class UnitsCapacityEvent extends Equatable {
  const UnitsCapacityEvent();

  @override
  List<Object> get props => [];
}

class GetUnitsCapacityEvent extends UnitsCapacityEvent {
  final int guest;

  const GetUnitsCapacityEvent({required this.guest});
}
