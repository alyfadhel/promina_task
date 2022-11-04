import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int? id;
  final String? name;
  final String? email;
  final Token? token;


 const User({
    required this.id,
    required this.name,
    required this.email,
   required this.token,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    token,
  ];

}

class Token extends Equatable
{
  final String? token;

 const Token({
    required this.token,
  });
  @override
  List<Object?> get props => [token];

}