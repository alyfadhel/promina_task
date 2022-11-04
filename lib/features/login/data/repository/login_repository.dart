import 'package:dartz/dartz.dart';
import 'package:promina/core/error/exception.dart';

import 'package:promina/core/error/failure.dart';
import 'package:promina/features/login/data/datasource/base_login_remote_data_source.dart';

import 'package:promina/features/login/domain/entities/login_entity.dart';

import '../../domain/repository/base_login_repository.dart';

class LoginRepository extends BaseLoginRepository
{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);
  @override
  Future<Either<Failure, User>> getLoginUser(UserLoginParameters parameters) async{
    final result = await baseLoginRemoteDataSource.getLoginUser(parameters);
    print(result);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}