import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wato/features/qr/presentation/pages/generate_qr_page/widgets/save_qr_button.dart';

import '../../../manager/generate_qr_logic/generate_qr_logic_cubit.dart';
import '../generate_qr_page.dart';

class ToGenerateQrPageButton extends StatelessWidget {
  const ToGenerateQrPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: OutlinedButton.icon(
        icon: Icon(Icons.qr_code_rounded),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GenerateQRCodePage(),
            ),
          );
        },
        label: Text("Generate Your WAto QR"),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}