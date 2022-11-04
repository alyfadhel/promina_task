import 'package:promina/features/login/domain/entities/login_entity.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class GetLoginLoadingState extends LoginStates{}

class ChangePasswordVisibility extends LoginStates{}

class GetLoginSuccessState extends LoginStates{
  final List<Item> login ;

  GetLoginSuccessState(this.login);
}

class GetLoginErrorState extends LoginStates{
  final String error;

  GetLoginErrorState(this.error);
}

class GetGalleryLoadingState extends LoginStates{}

class GetGallerySuccessState extends LoginStates{
  final List<Formdata> formdata;

  GetGallerySuccessState(this.formdata);
}

class GetGalleryErrorState extends LoginStates
{
  final String error;

  GetGalleryErrorState(this.error);
}