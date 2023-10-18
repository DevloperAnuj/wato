import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../manager/save_qr_code/save_qr_logic_cubit.dart';

class SaveQrButton extends StatelessWidget {
  final ScreenshotController _screenshotController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveQrLogicCubit(),
      child: Builder(builder: (context) {
        return BlocConsumer<SaveQrLogicCubit, SaveQrLogicState>(
          listener: (context, state) {
            if (state is SaveQrLogicFailed) {
              showTheSnackBar(context, text: state.err, color: Colors.red);
            }
            if (state is SaveQrLogicSuccess) {
              showTheSnackBar(
                context,
                text: "File Saved SuccessFully in Gallery",
                color: Colors.green,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: state is SaveQrLogicLoading
                  ? CircularProgressIndicator()
                  : OutlinedButton.icon(
                icon: Icon(Icons.save),
                onPressed: () {
                  context
                      .read<SaveQrLogicCubit>()
                      .saveCapturedImage(_screenshotController);
                },
                label: Text("Save Your WAto QR"),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  foregroundColor: Colors.black,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  const SaveQrButton({
    required ScreenshotController screenshotController,
  }) : _screenshotController = screenshotController;

  void showTheSnackBar(BuildContext context,
      {required String text, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: color,
      ),
    );
  }
}