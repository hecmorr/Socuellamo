part of 'lugar_bloc.dart';

abstract class LugarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InfoInitial extends LugarState {}

class InfoLoadInProgress extends LugarState {}

class InfoLoadFailure extends LugarState {
  InfoLoadFailure(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class InfoLoadSuccess extends LugarState {
  InfoLoadSuccess(this.lista);
  final List<Modelo> lista;
  @override
  List<Object?> get props => [lista];
}
