import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

part 'save_qr_logic_state.dart';

class SaveQrLogicCubit extends Cubit<SaveQrLogicState> {
  SaveQrLogicCubit() : super(SaveQrLogicInitial());

  void saveCapturedImage(ScreenshotController controller) async {
    emit(SaveQrLogicLoading());
    final Uint8List? bufferImage =
        await controller.capture(delay: Duration(seconds: 1));
    if (bufferImage != null) {
      final PermissionStatus status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        final result = await ImageGallerySaver.saveImage(bufferImage);
        if (result['isSuccess']) {
          emit(SaveQrLogicSuccess());
        } else {
          emit(SaveQrLogicFailed(err: "Storage Permission Denied"));
        }
      } else {
        emit(SaveQrLogicFailed(err: "Storage Permission Denied"));
      }
    } else {
      emit(SaveQrLogicFailed(err: "Failed To Create QR File"));
    }
  }
}
