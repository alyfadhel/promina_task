import 'package:dartz/dartz.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/core/usecase/base_usecase.dart';
import 'package:promina/features/login/domain/entities/login_entity.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';

class GetUserLoginUseCase extends BaseUseCase<User,UserLoginParameters>
{
  final BaseLoginRepository baseLoginRepository;

  GetUserLoginUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParameters parameters) async{
    return await baseLoginRepository.getLoginUser(parameters);
  }

}
