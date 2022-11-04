import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/usecase/base_usecase.dart';
import 'package:promina/features/login/data/models/login_model.dart';
import 'package:promina/features/login/domain/entities/login_entity.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';
import 'package:promina/features/login/domain/usecase/get_gallery_use_case.dart';
import 'package:promina/features/login/domain/usecase/get_login_user_usecase.dart';
import 'package:promina/features/login/presentation/controller/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  final GetUserLoginUseCase getUserLoginUseCase;
  LoginCubit(
      this.getUserLoginUseCase,
      ) :super(InitialLoginState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }



  Future<void>loginUser({
    required String email,
    required String password,
  })async
  {
    emit(GetLoginLoadingState());
    final result = await getUserLoginUseCase(
      UserLoginParameters(
          email: email,
          password: password,
      ));
    print(result);
    result.fold(
            (l) => emit(GetLoginErrorState(l.message)),
            (r) => emit(GetLoginSuccessState(r)),
    );
  }


}