import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_challenge/data/database/isar_database.dart';
import 'package:flutter_challenge/data/simpson_services.dart';
import 'package:flutter_challenge/domain/model/simpson_model.dart';

part 'simpson_event.dart';
part 'simpson_state.dart';

class SimpsonBloc extends Bloc<SimpsonEvent, SimpsonState> {
  SimpsonBloc() : super(SimpsonInitial()) {
    final simpsonServices = GetIt.I<SimpsonServices>();
    final simpsonDataBase = GetIt.I<IsarDataBase>();

    on<GetSimponsList>((event, emit) async {
      try {
        emit(SimpsonLoading());

        List<SimpsonModel> simpsonList =
            await simpsonServices.getSimponsList();
        await addIndexToCaracter(simpsonList: simpsonList);
        await simpsonDataBase.saveData(simpsons: simpsonList);
        emit(SimpsonLoadded(simpsonList: simpsonList));
      } catch (e) {
        emit(const SimpsonError(error: 'Error loding data, try again later.'));
      }
    });

    on<GetSimponsListDataBase>((event, emit) async {
      try {
        emit(SimpsonLoading());

        List<SimpsonModel> simpsonList = await simpsonDataBase.loadData();

        emit(SimpsonLoadded(simpsonList: simpsonList));
      } catch (e) {
        emit(const SimpsonError(error: 'Error loding data, try again later.'));
      }
    });
  }

  Future<void> addIndexToCaracter(
      {required List<SimpsonModel> simpsonList}) async {
    for (int i = 0; i < simpsonList.length; i++) {
      simpsonList[i].id = i;
    }
  }
}
