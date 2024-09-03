import 'package:air_bnb/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_class/product_list.dart';

part 'explore_screen_event.dart';
part 'explore_screen_state.dart';

class ExploreScreenBloc extends Bloc<ExploreScreenEvent, ExploreScreenState> {
  ExploreScreenBloc() : super(ExploreScreenInitial()) {
    on<FetchProduct>((event, emit) async {
      // TODO: implement event handler
      emit(ExploreLoading());
      try {
        final product = await ApiRepository().exploreProduct();
        emit(ExploreLoaded(productList: product));
      } catch (error) {
        emit(ExploreError(error.toString()));
      }
    });
  }
}
