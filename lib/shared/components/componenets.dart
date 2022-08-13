import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  required TextEditingController controller,
  String hint = "",
  required TextInputType type,
  required String? Function(String?) validate,
  bool isPassword = false,
  Widget? suffix,
  required IconData prefix,
  required String label,
  VoidCallback? onTap,
  bool isClickable = true,
  void Function(String)? onChanged,
  void Function(String)? onSubmit,
}) =>
    TextFormField(
      enabled: isClickable,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        prefixIcon: Icon(prefix),
        border: const OutlineInputBorder(),
        suffixIcon: suffix,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
    );

void navigateTo(context, route) =>
    Navigator.push(context, MaterialPageRoute(builder: (c) => route));

void navigateToAndFinish(context, route) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (c) => route),
      (route) => false,
    );

void showToast({required String msg, required ToastState state}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: getToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState{SUCSSES, ERROR, WARNNING}
Color getToastColor(ToastState r){
  switch(r){
    case ToastState.ERROR:
      return Colors.red;
    case ToastState.SUCSSES:
      return Colors.green;
    case ToastState.WARNNING:
      return Colors.yellow;
  }
}
