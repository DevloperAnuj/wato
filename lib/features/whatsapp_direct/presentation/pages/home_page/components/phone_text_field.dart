import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/phone_number_logic/phone_number_logic_cubit.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => serviceLocator.get<PhoneNumberLogicCubit>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocBuilder<PhoneNumberLogicCubit, String?>(
            builder: (context, phoneNumber) {
              return TextFormField(
                onChanged: (text) {
                  context.read<PhoneNumberLogicCubit>().setPhoneNumber(text);
                },
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
                maxLines: 1,
                initialValue: phoneNumber,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone No',
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
              );
            },
          ),
        ),
      ),
    );
  }
}
