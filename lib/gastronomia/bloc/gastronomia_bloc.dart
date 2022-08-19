import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socuellamo/common/model/model.dart';
import 'package:socuellamo/gastronomia/repository/gastronomia_repository.dart';
part 'gastronomia_event.dart';
part 'gastronomia_state.dart';

class GastronomiaBloc extends Bloc<GastronomiaEvent, GastronomiaState> {
  GastronomiaBloc({required GastronomiaRepository repository})
      : _repository = repository,
        super(GastronomiaInitial()) {
    on<GastronomiaFetched>(_onInfoFetched);
  }

  final GastronomiaRepository _repository;

  Future<void> _onInfoFetched(
    GastronomiaFetched event,
    Emitter<GastronomiaState> emit,
  ) async {
    emit(GastronomiaLoadInProgress());
    try {
      final lista = await _repository.getInfo();
      emit(GastronomiaLoadSuccess(lista));
    } catch (e) {
      emit(GastronomiaLoadFailure(e.toString()));
    }
  }
}
