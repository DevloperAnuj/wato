import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wato/features/qr/presentation/pages/generate_qr_page/widgets/save_qr_button.dart';

import '../../../manager/generate_qr_logic/generate_qr_logic_cubit.dart';

class MyQrImage extends StatefulWidget {
  @override
  State<MyQrImage> createState() => _MyQrImageState();
}

class _MyQrImageState extends State<MyQrImage> {

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQrLogicCubit, String?>(
      builder: (context, number) {
        if (number != null) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Screenshot(
                  controller: _screenshotController,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            'assets/images/wato.png',
                            height: 100,
                          ),
                        ),
                        Text(
                          "WAto",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "WAto QR for $number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: QrImageView(
                            data: number,
                            version: QrVersions.auto,
                            gapless: false,
                            size: 200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SaveQrButton(screenshotController: _screenshotController),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}