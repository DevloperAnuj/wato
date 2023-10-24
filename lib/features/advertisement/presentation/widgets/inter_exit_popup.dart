import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';

Future<bool> showExitPopup(context) async {
  late bool closeApp = false;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: '🌟 Review 🌟',
    desc: 'Would You Like To Review Our App ?',
    btnCancel: ElevatedButton(
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop(animated: true);
        } else if (Platform.isIOS) {
          exit(0);
        }
      },
      child: Text("Just Exit"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    ),
    btnOkOnPress: () async {
      await LaunchReview.launch().onError((error, stackTrace) => print(error));
    },
    btnOkText: "Review",
    headerAnimationLoop: false,
    dismissOnBackKeyPress: true,
  )..show();
  return closeApp;
}
