import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

part 'to_whatsapp_logic_state.dart';

class ToWhatsappLogicCubit extends Cubit<ToWhatsappLogicState> {
  ToWhatsappLogicCubit() : super(ToWhatsappLogicInitial());

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
