part of 'simpson_bloc.dart';

sealed class SimpsonState extends Equatable {
  const SimpsonState();

  @override
  List<Object> get props =>
      [SimpsonInitial, SimpsonLoading, SimpsonLoadded, SimpsonError];
}

final class SimpsonInitial extends SimpsonState {}

final class SimpsonLoading extends SimpsonState {}

final class SimpsonLoadded extends SimpsonState {
  final List<SimpsonModel> simpsonList;

  const SimpsonLoadded({required this.simpsonList});
}

final class SimpsonError extends SimpsonState {
  final String error;

  const SimpsonError({required this.error});
}
