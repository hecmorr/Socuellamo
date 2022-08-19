part of 'lugar_bloc.dart';

abstract class LugarEvent extends Equatable {
  const LugarEvent();
  @override
  List<Object?> get props => [];
}

class InfoFetched extends LugarEvent {
  const InfoFetched();
}
