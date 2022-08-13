import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_course/layouts/shop_layout.dart';
import 'package:shop_app_course/shared/network/local/cache_helper.dart';
import '../../shared/components/componenets.dart';
import '../../styles/themes.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is SuccessesLoginState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(key: "token", value: state.loginModel.data!.token).then((value) {
                navigateToAndFinish(context, const ShopLayout());
              });
            } else {
              showToast(
                  msg: state.loginModel.message, state: ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login now to browse our hot offers",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "please enter your email address";
                              }
                              return null;
                            },
                            prefix: Icons.email_outlined,
                            label: "Email Address"),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "please enter your password";
                              }
                            },
                            suffix: IconButton(
                                onPressed: () {
                                  cubit.changeShowPassword();
                                },
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  color: cubit.visibleIconColor,
                                )),
                            prefix: Icons.lock_open_outlined,
                            label: "Password",
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            isPassword: cubit.isPassword),
                        const SizedBox(
                          height: 30,
                        ),
                        state is! LoadingLoginState
                            ? MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                height: 55,
                                elevation: 0.0,
                                minWidth: double.infinity,
                                child: Text(
                                  "LOGIN",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.white),
                                ),
                                color: defaultColor,
                              )
                            : const Center(child: CircularProgressIndicator()),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, const RegisterScreen());
                                },
                                child: const Text("REGISTER"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
