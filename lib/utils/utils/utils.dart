import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          forwardAnimationCurve: Curves.decelerate,
          borderRadius: BorderRadius.circular(10),
          message: message,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
            size: 28,
          ),
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: Colors.red,
        )..show(context));
  }

  static void changeFocusNode(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
