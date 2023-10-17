import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'app_life_cycle_reactor_state.dart';

class AppLifeCycleReactorCubit extends Cubit<AppLifeCycleReactorState> {
  AppLifeCycleReactorCubit() : super(AppLifeCycleReactorInitial());



}
