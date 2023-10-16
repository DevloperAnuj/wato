import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/check_package_logic/check_package_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/is_whatsapp_business_logic/is_whatsapp_business_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/link_logic/linl_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/message_logic/message_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/phone_number_logic/phone_number_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/pick_files_logic/pick_files_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/pages/home_page/components/just_textfield.dart';
import '../../manager/country_code_logic/country_code_logic_cubit.dart';
import '../../manager/to_whatsapp_logic/to_whatsapp_logic_cubit.dart';
import 'components/link_textfield.dart';
import 'components/to_whatsapp_button.dart';
import 'components/whats_business_choice.dart';
import 'widgets/file_picking.dart';
import 'widgets/input_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CheckPackageLogicCubit()..checkWhatsBusinessInstalled(),
        ),
        BlocProvider(
          create: (context) => IsWhatsappBusinessCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CountryCodeLogicCubit()..getDefaultCountryCode(context),
        ),
        BlocProvider(
          create: (context) => PhoneNumberLogicCubit(),
        ),
        BlocProvider(
          create: (context) => PickFilesLogicCubit(),
        ),
        BlocProvider(
          create: (context) => MessageLogicCubit(),
        ),
        BlocProvider(
          create: (context) => LinkLogicCubit(),
        ),
        BlocProvider(
          create: (context) => ToWhatsappLogicCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/wato.png',
                height: 35,
                width: 40,
              ),
              const Text(
                "WAto",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () {
            toggleFocus(context);
          },
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlocBuilder<PickFilesLogicCubit, List<String>>(
                  builder: (context, selectedFiles) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const WhatsBusinessChoice(),
                        const InputField(),
                        const FilePicking(),
                        if (selectedFiles.isEmpty) const JustTextField(),
                        if (selectedFiles.isEmpty) const LinkTextField(),
                        const ToWhatsAppButton(),
                      ],
                    );
                  },
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
