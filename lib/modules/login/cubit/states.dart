

import '../../../models/login_model.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}
class PasswordVisibleLoginState extends LoginStates{}
class SuccessesLoginState extends LoginStates{
  final LoginModel loginModel;
  SuccessesLoginState(this.loginModel);
}
class LoadingLoginState extends LoginStates{}
class ErrorLoginState extends LoginStates{
  final String error;


  ErrorLoginState(this.error);
}