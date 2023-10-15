import 'package:flutter/material.dart';
import 'package:share_to_whatsapp/whatsapp_share.dart';

class ToWhatsAppButton extends StatelessWidget {
  const ToWhatsAppButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 30),
        child: ElevatedButton.icon(
          onPressed: () {
            sendToWhatsApp(
              package: Package.businessWhatsapp,
              text: "WhatsApp Text",
              phone: "917517985137",
              files: [],
              link: "https://imalpha.co.in",
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
          label: const Text(' To WhatsApp'),
        ),
      ),
    );
  }

  Future<void> sendToWhatsApp({
    required List<String> files,
    required Package package,
    required String phone,
    required String? link,
    required String? text,
  }) async {
    if (files.isNotEmpty) {
      await WhatsappShare.shareFile(
        filePath: files,
        phone: phone,
        text: text,
        package: package,
      );
    } else {
      await WhatsappShare.share(
        text: text,
        linkUrl: link,
        phone: phone,
        package: package,
      );
    }
  }
}