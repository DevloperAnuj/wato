import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:share_to_whatsapp/whatsapp_share.dart';

part 'check_package_logic_state.dart';

class CheckPackageLogicCubit extends Cubit<bool> {
  CheckPackageLogicCubit() : super(false);

  void checkWhatsBusinessInstalled() async {
    final whatsBusiness = await WhatsappShare.isInstalled(
        package: Package.businessWhatsapp
    );
    emit(whatsBusiness!);
  }

}
