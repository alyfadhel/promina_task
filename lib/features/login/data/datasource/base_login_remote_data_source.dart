import 'package:promina/core/error/exception.dart';
import 'package:promina/core/network/dio_helper.dart';
import 'package:promina/core/network/end-points.dart';
import 'package:promina/features/login/data/models/login_model.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';

abstract class BaseLoginRemoteDataSource
{
  Future<UserModel>getLoginUser(UserLoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource
{
  final DioHelper dioHelper;

  LoginRemoteDataSource(this.dioHelper);
  @override
  Future<UserModel> getLoginUser(UserLoginParameters parameters) async{
    final response = await dioHelper.post(
        endPoint: login,
      data: {
          'email' : parameters.email,
          'password' : parameters.password,
      },
      token: token,
    );
    return UserModel.fromJson(response);
    }

  }

