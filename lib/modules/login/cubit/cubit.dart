import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_course/modules/login/cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../styles/themes.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  bool isPassword = true;
  Color visibleIconColor = Colors.grey;
  late LoginModel loginModel;


  static LoginCubit get(context) => BlocProvider.of(context);

  void changeShowPassword() {
    if (isPassword) {
      isPassword = false;
      visibleIconColor = defaultColor;
    } else {
      isPassword = true;
      visibleIconColor = Colors.grey;
    }
    emit(PasswordVisibleLoginState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value)  {
      loginModel = LoginModel.fromJson(value.data);
      emit(SuccessesLoginState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ErrorLoginState(error.toString()));
    });
  }
}
