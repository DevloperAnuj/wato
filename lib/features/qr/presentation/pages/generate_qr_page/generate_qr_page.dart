import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/features/qr/presentation/manager/generate_qr_logic/generate_qr_logic_cubit.dart';
import 'package:wato/features/qr/presentation/pages/generate_qr_page/widgets/generate_qr_button.dart';
import 'package:wato/features/qr/presentation/pages/generate_qr_page/widgets/phone_number_field.dart';
import 'package:wato/features/qr/presentation/pages/generate_qr_page/widgets/qr_image.dart';

class GenerateQRCodePage extends StatelessWidget {
  const GenerateQRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateQrLogicCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Generate WAto QR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            toggleFocus(context);
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: PhoneNumberField(),
                        ),
                        GenerateQrButton(),
                      ],
                    ),
                    MyQrImage()
                  ],
                ),
              ),
            ),
          ),
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
