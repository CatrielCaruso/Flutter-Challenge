part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final int selectedIndexNavigationBar;
  final List<Widget> screens;
  const NavigationState(
      {this.selectedIndexNavigationBar = 0,
      this.screens = const [
        SimpsonListScreen(),
        SettingScreen(),
      ]});

  NavigationState copyWith({
    int? selectedIndexNavigationBar,
    List<Widget>? screens,
  }) =>
      NavigationState(
          selectedIndexNavigationBar:
              selectedIndexNavigationBar ?? this.selectedIndexNavigationBar,
          screens: screens ?? this.screens);

  @override
  List<Object> get props => [selectedIndexNavigationBar, screens];
}
