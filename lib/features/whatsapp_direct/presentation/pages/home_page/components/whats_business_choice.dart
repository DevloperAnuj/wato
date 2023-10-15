import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/check_package_logic/check_package_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/is_whatsapp_business_logic/is_whatsapp_business_cubit.dart';

class WhatsBusinessChoice extends StatelessWidget {

  const WhatsBusinessChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPackageLogicCubit, bool>(
      builder: (context, isInstalled) {
        if (isInstalled) {
          return BlocBuilder<IsWhatsappBusinessCubit, int>(
            builder: (context, selected) {
              return ChipsChoice.single(
                value: selected,
                choiceItems: const [
                  C2Choice(
                    value: 0,
                    label: 'WhatsApp',
                    style: C2ChipStyle(
                      height: 40,
                      backgroundOpacity: 0.3,
                    ),
                  ),
                  C2Choice(
                    value: 1,
                    label: 'WhatsApp Business',
                    style: C2ChipStyle(
                      height: 40,
                      backgroundOpacity: 0.3,
                    ),
                  )
                ],
                onChanged: (val) {
                  context.read<IsWhatsappBusinessCubit>().togglePackage(val);
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
