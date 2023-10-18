import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/generate_qr_logic/generate_qr_logic_cubit.dart';

class GenerateQrButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton.icon(
        icon: Icon(Icons.qr_code_rounded),
        onPressed: () {
          toggleFocus(context);
          context.read<GenerateQrLogicCubit>().createQrCode();
        },
        label: Text("Generate"),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  void toggleFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}