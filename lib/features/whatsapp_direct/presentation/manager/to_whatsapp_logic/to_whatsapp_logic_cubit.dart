import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wato/config/app_env.dart';

part 'to_whatsapp_logic_state.dart';

class ToWhatsappLogicCubit extends Cubit<ToWhatsappLogicState> {
  ToWhatsappLogicCubit() : super(ToWhatsappLogicInitial());

  static const waMethodChannel = MethodChannel("whats-app-channel");

  Future<void> sendToWhatsApp({
    required List<String> files,
    required int packageCode,
    required String phone,
    required String? link,
    required String? text,
  }) async {
    emit(ToWhatsappLogicLoading());
    if (files.isNotEmpty) {
      // await WhatsappShare.shareFile(
      //   filePath: files,
      //   phone: phone,
      //   text: text,
      //   package: package,
      // );
    } else {
      await towardWhatsApp(
        number: phone,
        package: packageCode,
        message: text,
        link: link,
      ).then((_) {
        Future.delayed(Duration(seconds: 2), () {
          emit(ToWhatsappLogicSuccess());
        });
      }).onError((error, stackTrace) {
        emit(ToWhatsappLogicFailed());
      });
    }
  }

  Future<void> towardWhatsApp({
    required String number,
    required int package,
    String? message,
    String? link,
  }) async {
    Map<String, dynamic> parameters = {
      "phone": number,
      "message": message ?? "",
      "link": link ?? "",
      "package": package,
    };
    try {
      final result = await waMethodChannel.invokeMethod("to_whats", parameters);
      devLogger.d(result);
    } catch (e) {
      devLogger.e(e);
    } finally {}
  }
}
