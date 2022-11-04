import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/features/login/domain/entities/login_entity.dart';

abstract class BaseLoginRepository
{
  Future<Either<Failure,List<Item>>>getLoginUser(UserLoginParameters parameters);

  Future<Either<Failure,List<Formdata>>>getGallery();
}

class UserLoginParameters extends Equatable
{
  final String? email;
  final String? password;

 const UserLoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    email,
    password,
  ];

}