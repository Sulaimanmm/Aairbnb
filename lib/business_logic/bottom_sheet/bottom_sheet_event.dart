part of 'bottom_sheet_bloc.dart';

sealed class BottomSheetEvent extends Equatable {
  const BottomSheetEvent();

  @override
  List<Object> get props => [];
}

class OpenBottomSheet extends BottomSheetEvent {}

class CloseBottomSheet extends BottomSheetEvent {}
