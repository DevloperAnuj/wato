import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

part 'scan_qr_logic_state.dart';

class ScanQrLogicCubit extends Cubit<String?> {
  ScanQrLogicCubit() : super(null);

  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? _code;

  void scanQRCode(BuildContext context) async {
    emit(null);
    _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
      context: context,
      onCode: (code) {
        _code = code;
        emit(_code);
      },
    );
  }
}
