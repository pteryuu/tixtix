import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tixtix/models/concerts_model.dart';
import 'package:tixtix/services/concert_service.dart';

part 'concert_state.dart';

class ConcertCubit extends Cubit<ConcertState> {
  ConcertCubit() : super(ConcertInitial());

  void fetchConcerts() async {
    try {
      emit(ConcertLoading());
      List<ConcertModel> concerts = await ConcertService().fetchConcerts();
      emit(ConcertSuccess(concerts));
    } catch (e) {
      emit(ConcertFailed(e.toString()));
    }
  }
}
