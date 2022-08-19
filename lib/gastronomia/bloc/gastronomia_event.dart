part of 'gastronomia_bloc.dart';

abstract class GastronomiaEvent extends Equatable {
  const GastronomiaEvent();

  @override
  List<Object> get props => [];
}

class GastronomiaFetched extends GastronomiaEvent {
  const GastronomiaFetched();
}
