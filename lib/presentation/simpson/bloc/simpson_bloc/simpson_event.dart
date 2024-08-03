part of 'simpson_bloc.dart';

sealed class SimpsonEvent extends Equatable {
  const SimpsonEvent();

  @override
  List<Object> get props => [];
}

class GetSimponsList extends SimpsonEvent {}

class GetSimponsListDataBase extends SimpsonEvent {}
