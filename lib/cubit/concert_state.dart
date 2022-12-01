part of 'concert_cubit.dart';

abstract class ConcertState extends Equatable {
  const ConcertState();

  @override
  List<Object> get props => [];
}

class ConcertInitial extends ConcertState {}

class ConcertLoading extends ConcertState {}

class ConcertSuccess extends ConcertState {
  final List<ConcertModel> concerts;

  ConcertSuccess(this.concerts);

  @override
  List<Object> get props => [concerts];
}

class ConcertFailed extends ConcertState {
  final String err;

  ConcertFailed(this.err);

  @override
  List<Object> get props => [err];
}
