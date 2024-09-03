import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_screen_event.dart';
part 'bottom_navigation_screen_state.dart';

class BottomNavigationScreenBloc
    extends Bloc<BottomNavigationScreenEvent, BottomNavigationScreenState> {
  BottomNavigationScreenBloc()
      : super(const BottomNavigationScreenInitial(tabIndex: 0)) {
    on<BottomNavigationScreenEvent>((event, emit) {
      if (event is TabChange) {
        emit(BottomNavigationScreenInitial(tabIndex: event.tabIndex));
      }
      // TODO: implement event handler
    });
  }
}
