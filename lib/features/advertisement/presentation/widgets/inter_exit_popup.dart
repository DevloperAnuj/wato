import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/app_env.dart';
import 'package:wato/features/advertisement/presentation/manager/inter_ad_logic/inter_ad_logic_cubit.dart';

Future<bool> showInterExitPopup(context) async {
  late bool closeApp = false;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: '🌟 Review 🌟',
    desc: 'Would You Like To Review Our App ?',
    btnCancel: BlocProvider(
      create: (context) => AppEnv.interAdLogicCubit,
      child: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () {
            context.read<InterAdLogicCubit>().displayInterAd();
          },
          child: Text("Just Exit"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        );
      }),
    ),
    btnOkOnPress: () {
      //TODO: To Review Screen
    },
    headerAnimationLoop: false,
    dismissOnBackKeyPress: true,
  )..show();
  return closeApp;
}
