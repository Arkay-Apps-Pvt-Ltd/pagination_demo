import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';
import '../constants/Constants.dart';

Widget loadLocalImageRound({
  required String imagePath,
  double? height,
  double? width,
  Color? imageColor,
  BoxFit? boxFit,
}) {
  return ClipOval(
    child: Image.asset(
      imagePath,
      width: width,
      height: height,
      color: imageColor,
      fit: boxFit,
    ),
  );
}

Widget horizontalSpace(BuildContext context, double horizontalSpace) {
  return SizedBox(
    width: MediaQuery.of(context).size.shortestSide * horizontalSpace,
  );
}

Widget verticalSpace(BuildContext context, double verticalSpace) {
  return SizedBox(
    height: MediaQuery.of(context).size.longestSide * verticalSpace,
  );
}

void showInfoToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.black87,
    backgroundColor: Colors.grey.shade200,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

void showSuccessToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: primaryColor,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: primaryColor,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

void showErrorToast(BuildContext context, String message) {
  if (Platform.isMacOS) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.longestSide * 0.018,
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  Fluttertoast.showToast(
    msg: message,
    textColor: Colors.white,
    backgroundColor: Colors.red,
    gravity: ToastGravity.BOTTOM,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
  );
}

flutterPrint({required msg}) {
  return isInDevelopment ? print(msg) : "";
}