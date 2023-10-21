import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_package_logic_state.dart';

class CheckPackageLogicCubit extends Cubit<bool> {
  CheckPackageLogicCubit() : super(false);

  static const waMethodChannel = MethodChannel("whats-app-channel");

  void checkWhatsBusinessInstalled() async {
    final whatsBusiness = await waMethodChannel.invokeMethod("is_whatsb");
    emit(whatsBusiness!);
  }

}
