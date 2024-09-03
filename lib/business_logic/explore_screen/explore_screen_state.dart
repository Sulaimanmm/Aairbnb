part of 'explore_screen_bloc.dart';

sealed class ExploreScreenState extends Equatable {
  const ExploreScreenState();
}

final class ExploreScreenInitial extends ExploreScreenState {
  @override
  List<Object> get props => [];
}

class ExploreLoading extends ExploreScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ExploreLoaded extends ExploreScreenState {
  final ProductList productList;

  const ExploreLoaded({required this.productList});

  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}

class ExploreError extends ExploreScreenState {
  final String message;

  const ExploreError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
