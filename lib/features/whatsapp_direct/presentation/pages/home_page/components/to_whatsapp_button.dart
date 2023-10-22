import 'package:country_calling_code_picker/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/advertisement/presentation/manager/app_open_ad_logic/app_open_ad_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/country_code_logic/country_code_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/is_whatsapp_business_logic/is_whatsapp_business_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/link_logic/linl_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/message_logic/message_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/phone_number_logic/phone_number_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/pick_files_logic/pick_files_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/to_whatsapp_logic/to_whatsapp_logic_cubit.dart';

class ToWhatsAppButton extends StatelessWidget {
  const ToWhatsAppButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: serviceLocator.get<IsWhatsappBusinessCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<CountryCodeLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<PhoneNumberLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<PickFilesLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<MessageLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<LinkLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<ToWhatsappLogicCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator.get<AppOpenAdLogicCubit>(),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: BlocBuilder<IsWhatsappBusinessCubit, int>(
            builder: (context, packageCode) {
              return BlocBuilder<CountryCodeLogicCubit, Country?>(
                builder: (context, country) {
                  return BlocBuilder<PhoneNumberLogicCubit,
                      TextEditingController>(
                    builder: (context, phoneNumber) {
                      return BlocBuilder<PickFilesLogicCubit, List<String>>(
                        builder: (context, pickedFiles) {
                          return BlocBuilder<MessageLogicCubit, String?>(
                            builder: (context, messageText) {
                              return BlocBuilder<LinkLogicCubit, String?>(
                                builder: (context, linkText) {
                                  return BlocBuilder<ToWhatsappLogicCubit,
                                      ToWhatsappLogicState>(
                                    builder: (context, state) {
                                      if (state is ToWhatsappLogicLoading) {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      return ElevatedButton.icon(
                                        onPressed: () {
                                          sendToWhatsApp(
                                            context,
                                            packageCode: packageCode,
                                            text: messageText,
                                            phone:
                                                "${country!.callingCode.substring(1)}${phoneNumber.text}",
                                            files: pickedFiles,
                                            link: linkText,
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                        ),
                                        icon: const Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        ),
                                        label: Text(packageCode == 0
                                            ? 'To WhatsApp'
                                            : "To WhatsApp Business"),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> sendToWhatsApp(
    BuildContext context, {
    required List<String> files,
    required int packageCode,
    required String phone,
    required String? link,
    required String? text,
  }) async {
    if (phone.length < 7) {
      showTheSnackBar(
        context,
        text: "Phone Number is Not Valid",
        color: Colors.red,
      );
      return;
    }
    if (text!.isEmpty && files.isEmpty) {
      showTheSnackBar(
        context,
        text: "Message Can't be Empty",
        color: Colors.red,
      );
      return;
    }
    toggleFocus(context);
    context.read<ToWhatsappLogicCubit>().sendToWhatsApp(
          files: files,
          packageCode: packageCode,
          phone: phone,
          link: link,
          text: text,
        );
  }

  void toggleFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void showTheSnackBar(BuildContext context,
      {required String text, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: color,
      ),
    );
  }
}
