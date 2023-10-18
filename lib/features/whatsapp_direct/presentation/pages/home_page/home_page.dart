import 'package:flutter/material.dart';
import 'package:wato/features/advertisement/presentation/widgets/app_open_ad_widget.dart';
import 'package:wato/features/advertisement/presentation/widgets/baner_ad_widget.dart';
import 'package:wato/features/advertisement/presentation/widgets/inter_exit_popup.dart';
import 'package:wato/features/update/presentation/widgets/update_button.dart';
import 'package:wato/features/whatsapp_direct/presentation/pages/home_page/components/just_textfield.dart';
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
    return Scaffold(
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
        actions: [
          const UpdateButton(),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          toggleFocus(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: WillPopScope(
              onWillPop: () async => showExitPopup(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const WhatsBusinessChoice(),
                  const InputField(),
                  const FilePicking(),
                  const JustTextField(),
                  const LinkTextField(),
                  const ToWhatsAppButton(),
                  const AppOpenAdWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBannerAdWidget(),
    );
  }

  void toggleFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
