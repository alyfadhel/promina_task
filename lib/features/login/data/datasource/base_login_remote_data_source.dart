import 'package:promina/core/error/exception.dart';
import 'package:promina/core/network/dio_helper.dart';
import 'package:promina/core/network/end-points.dart';
import 'package:promina/features/login/data/models/login_model.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';

abstract class BaseLoginRemoteDataSource
{
  Future<List<ItemModel>>getLoginUser(UserLoginParameters parameters);
  Future<List<FormdataModel>>getGallery();
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource
{
  final DioHelper dioHelper;

  LoginRemoteDataSource(this.dioHelper);
  @override
  Future<List<ItemModel>> getLoginUser(UserLoginParameters parameters) async{
    final response = await dioHelper.get(
        endPoint: baseApiUrl,
      data: {
          'email' : parameters.email,
          'password' : parameters.password,
      },
      token: token,
    );
    return List<ItemModel>.from((response['item']as List)
        .map((e) => ItemModel.fromJson(e)));
    }

  @override
  Future<List<FormdataModel>> getGallery() async{
    final response = await dioHelper.get(
        endPoint: baseApiUrl,
    );
    return List<FormdataModel>.from((response['body']as List)
    .map((e) => FormdataModel.fromJson(e)));
  }
  }

