import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:promina/core/resources/assets_manager.dart';
import 'package:promina/core/resources/strings_manager.dart';
import 'package:promina/core/services/service_locator.dart';
import 'package:promina/features/login/presentation/controller/cubit.dart';
import 'package:promina/features/login/presentation/controller/states.dart';
import 'package:promina/features/login/presentation/screens/home_screen.dart';
import 'package:promina/features/login/widgets/auth_button.dart';
import 'package:promina/features/login/widgets/text_form.dart';


var emailController = TextEditingController();
var passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if(state is GetLoginSuccessState){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GalleryScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          ImageAssets.login
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.my,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.black54),
                    ),
                    const Text(
                      AppStrings.gallery,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: height / 2.2,
                      width: width / 1.2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.white.withOpacity(.4),
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Text(
                              AppStrings.login,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: defaultTextForm(
                                  labelText: AppStrings.userName,
                                  hintText: AppStrings.userName,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: defaultTextForm(
                                  passwd: true,
                                  labelText: AppStrings.password,
                                  hintText: AppStrings.password,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                                width: MediaQuery.of(context).size.width/1.4,
                                child: Conditional.single(
                                  context: context,
                                  conditionBuilder: (context) => state is! GetLoginLoadingState,
                                  widgetBuilder: (context) => authButton(
                                    onPressed: (){
                                      cubit.loginUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                      );
                                    },
                                    context: context,
                                    authButtonText: AppStrings.submit,
                                  ),
                                  fallbackBuilder: (context) => const Center(child: CircularProgressIndicator()),
                                ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ]),
        );
      },
    );
  }
}