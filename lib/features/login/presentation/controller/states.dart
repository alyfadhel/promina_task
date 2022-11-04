import 'package:promina/features/login/domain/entities/login_entity.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class GetLoginLoadingState extends LoginStates{}

class ChangePasswordVisibility extends LoginStates{}

class GetLoginSuccessState extends LoginStates{
  final User user ;

  GetLoginSuccessState(this.user);
}

class GetLoginErrorState extends LoginStates{
  final String error;

  GetLoginErrorState(this.error);
}

