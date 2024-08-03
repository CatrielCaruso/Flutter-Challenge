import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/setting/screen/setting_screen.dart';
import 'package:flutter_challenge/presentation/simpson/screens/home_screen.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<NavigationEventChange>((event, emit) {
      emit(state.copyWith(selectedIndexNavigationBar: event.value));
    });
  }
}
