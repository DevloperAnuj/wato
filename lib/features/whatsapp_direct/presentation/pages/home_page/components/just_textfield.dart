import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/message_logic/message_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/pick_files_logic/pick_files_logic_cubit.dart';

class JustTextField extends StatelessWidget {
  const JustTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator.get<MessageLogicCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator.get<PickFilesLogicCubit>(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: BlocBuilder<PickFilesLogicCubit, List<String>>(
          builder: (context, filesList) {
            if(filesList.isNotEmpty){
              return SizedBox.shrink();
            }
            return BlocBuilder<MessageLogicCubit, String?>(
              builder: (context, messageText) {
                return TextFormField(
                  onChanged: (text) {
                    context.read<MessageLogicCubit>().setMessageText(text);
                  },
                  initialValue: messageText,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your Message',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(
                      left: 14.0,
                      bottom: 6.0,
                      top: 8.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green,
                          width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey,
                          width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
