import 'package:promina/features/login/domain/entities/login_entity.dart';

class UserModel extends User
{
 const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
  });

 factory UserModel.fromJson(Map<String,dynamic>json)
 {
   return UserModel(
       id: json['id'],
       name: json['name'],
       email: json['email'],
       token: json['token'] != null? TokenModel.fromJson(json['token']): null,
   );
 }

}

class TokenModel extends Token
{
  const TokenModel({
    required super.token,
  });

  factory TokenModel.fromJson(Map<String,dynamic>json)
  {
    return TokenModel(
        token: json['token'],
    );
  }

}