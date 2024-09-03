part of 'bottom_navigation_screen_bloc.dart';

sealed class BottomNavigationScreenEvent extends Equatable {
  const BottomNavigationScreenEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends BottomNavigationScreenEvent {
  final int tabIndex;

  const TabChange({required this.tabIndex});
}
