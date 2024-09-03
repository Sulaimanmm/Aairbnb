part of 'bottom_sheet_bloc.dart';

abstract class BottomSheetState extends Equatable {
  const BottomSheetState();

  @override
  List<Object> get props => [];
}

class BottomSheetInitial extends BottomSheetState {}

class BottomSheetOpened extends BottomSheetState {}

class BottomSheetClosed extends BottomSheetState {}
