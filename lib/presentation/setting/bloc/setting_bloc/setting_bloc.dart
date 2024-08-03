import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/core/preference/preference.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState(isLight: Preferences.isLight)) {
    on<ModeEventChange>((event, emit) {
      emit(state.copyWith(isLight: event.value));
      Preferences.isLight = event.value;
    });
  }
}
