import 'package:flutter/material.dart';
import '../components/country_picker.dart';
import '../components/phone_text_field.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryPicker(),
          PhoneTextField(),
        ],
      ),
    );
  }
}