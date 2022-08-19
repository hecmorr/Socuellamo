part of 'gastronomia_bloc.dart';

abstract class GastronomiaState extends Equatable {
  const GastronomiaState();

  @override
  List<Object> get props => [];
}

class GastronomiaInitial extends GastronomiaState {}

class GastronomiaLoadInProgress extends GastronomiaState {}

class GastronomiaLoadFailure extends GastronomiaState {
  const GastronomiaLoadFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class GastronomiaLoadSuccess extends GastronomiaState {
  const GastronomiaLoadSuccess(this.lista);
  final List<Modelo> lista;
  @override
  List<Object> get props => [lista];
}
