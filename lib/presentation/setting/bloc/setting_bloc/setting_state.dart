part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final bool isLight;
  const SettingState({required this.isLight});

  SettingState copyWith({
    bool? isLight,
  }) =>
      SettingState(isLight: isLight ?? this.isLight);

  @override
  List<Object?> get props => [isLight];
}
