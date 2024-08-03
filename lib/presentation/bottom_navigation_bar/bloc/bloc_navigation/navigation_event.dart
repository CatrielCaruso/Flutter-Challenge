part of 'navigation_bloc.dart';

sealed class NavigationEvent {
  const NavigationEvent();
}

class NavigationEventChange extends NavigationEvent {
  final int value;

  const NavigationEventChange(this.value);
}
