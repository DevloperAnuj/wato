import 'package:flutter/material.dart';
import 'package:wato/features/whatsapp_direct/presentation/pages/home_page/components/just_textfield.dart';
import 'dart:ui';
import 'components/to_whatsapp_button.dart';
import 'components/whats_business_choice.dart';
import 'widgets/file_picking.dart';
import 'widgets/input_field.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WA to"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhatsBusinessChoice(),
                InputField(),
                FilePicking(),
                JustTextField(),
                LinkTextField(),
                ToWhatsAppButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

