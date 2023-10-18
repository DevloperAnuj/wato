import 'package:flutter/material.dart';
import '../components/country_picker.dart';
import '../components/phone_text_field.dart';
import '../components/qr_scan_button.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryPicker(),
          PhoneTextField(),
          QRScanButton(),
        ],
      ),
    );
  }
}