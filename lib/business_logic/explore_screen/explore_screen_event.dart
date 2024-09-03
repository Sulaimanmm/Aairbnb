part of 'explore_screen_bloc.dart';

sealed class ExploreScreenEvent extends Equatable {
  const ExploreScreenEvent();
}

class FetchProduct extends ExploreScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
