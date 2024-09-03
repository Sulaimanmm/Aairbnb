part of 'bottom_navigation_screen_bloc.dart';

abstract class BottomNavigationScreenState extends Equatable {
  const BottomNavigationScreenState(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

class BottomNavigationScreenInitial extends BottomNavigationScreenState {
  const BottomNavigationScreenInitial({required int tabIndex})
      : super(tabIndex);
}
