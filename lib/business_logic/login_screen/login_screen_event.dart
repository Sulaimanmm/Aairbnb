part of 'login_screen_bloc.dart';

@immutable
sealed class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginScreenEvent {
  final int phonenumber;

  const LoginButtonPressed({required this.phonenumber});

  @override
  List<Object> get props => [phonenumber];
}
