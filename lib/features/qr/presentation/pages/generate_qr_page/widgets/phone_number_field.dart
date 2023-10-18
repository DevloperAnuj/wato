import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/generate_qr_logic/generate_qr_logic_cubit.dart';

class PhoneNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: (text) {
          context.read<GenerateQrLogicCubit>().setNumber(number: text);
        },
        style: const TextStyle(color: Colors.black),
        keyboardType: TextInputType.phone,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'WhatsApp Number',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 6.0,
            top: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}