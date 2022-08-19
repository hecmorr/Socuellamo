import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socuellamo/common/model/model.dart';
import 'package:socuellamo/lugar/repository/lugar_repository.dart';

part 'lugar_event.dart';
part 'lugar_state.dart';

class LugarBloc extends Bloc<LugarEvent, LugarState> {
  LugarBloc({required LugarRepository repository})
      : _repository = repository,
        super(InfoInitial()) {
    on<InfoFetched>(_onInfoFetched);
  }

  final LugarRepository _repository;

  Future<void> _onInfoFetched(
    InfoFetched event,
    Emitter<LugarState> emit,
  ) async {
    emit(InfoLoadInProgress());
    try {
      final lista = await _repository.getInfo();
      emit(InfoLoadSuccess(lista));
    } catch (e) {
      emit(InfoLoadFailure(e.toString()));
    }
  }
}
