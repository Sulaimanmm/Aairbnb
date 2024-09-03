part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];
}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenSuccess extends LoginScreenState {}

final class LoginScreenFailure extends LoginScreenState {
  final String error;

  const LoginScreenFailure({required this.error});

  @override
  List<Object> get props => [error];
}
