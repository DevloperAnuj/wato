import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/link_logic/linl_logic_cubit.dart';

class LinkTextField extends StatelessWidget {

  const LinkTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: BlocBuilder<LinkLogicCubit, String?>(
        builder: (context, linkText) {
          return TextFormField(
            onChanged: (text) {
              context.read<LinkLogicCubit>().setLinkText(text);
            },
            initialValue: linkText,
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.url,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Link Text (Optional)',
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
    );
  }
}
