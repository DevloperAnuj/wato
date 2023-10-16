import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_open_ad_logic_state.dart';

class AppOpenAdLogicCubit extends Cubit<AppOpenAdLogicState> {
  AppOpenAdLogicCubit() : super(AppOpenAdLogicInitial());
}
