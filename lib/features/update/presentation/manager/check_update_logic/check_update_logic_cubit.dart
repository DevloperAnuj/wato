import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_launcher_plus/store_launcher_plus.dart';
import 'package:update_available/update_available.dart';

part 'check_update_logic_state.dart';

class CheckUpdateLogicCubit extends Cubit<CheckUpdateLogicState> {
  CheckUpdateLogicCubit() : super(CheckUpdateLogicInitial());

  checkUpdate() async {
    try {
      final updateAvailability = await getUpdateAvailability();
      final state = switch (updateAvailability) {
        UpdateAvailable() => emit(CheckUpdateLogicUpdate()),
        NoUpdateAvailable() => emit(CheckUpdateLogicOk()),
        UnknownAvailability() => emit(CheckUpdateLogicError()),
      };
      return state;
    } catch (e) {
      print(e);
      emit(CheckUpdateLogicError());
    }
  }

  goToPlayStore() async {
    try {
      final appId = 'inc.imalpha.wato';
        await StoreLauncher.launchPlayStore(packageName: appId).catchError((e) {
         print('ERROR> $e');
         return e;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
