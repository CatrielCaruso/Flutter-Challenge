part of 'setting_bloc.dart';

class SettingEvent {
  const SettingEvent();
}

class ModeEventChange extends SettingEvent {
  final bool value;

  const ModeEventChange(this.value);
}

class ModeEventChangeInit extends SettingEvent {
  final bool value;

  const ModeEventChangeInit(this.value);
}
