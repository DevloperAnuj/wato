import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../config/app_env.dart';

part 'app_open_ad_logic_state.dart';

class AppOpenAdLogicCubit extends Cubit<AppOpenAdLogicState> {
  AppOpenAdLogicCubit() : super(AppOpenAdLogicInitial());

  //Skip Showing Add When File Picking
  late bool filePickCall;

  void skipFilePick(bool pick) {
    filePickCall = pick;
  }

  //App State Listening Logic
  void listenToAppStateChanges() {
    _loadAppOpenAd();
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    // Try to show an app open ad if the app is being resumed and
    // we're not already showing an app open ad.
    if (appState == AppState.foreground) {
      if (filePickCall) {
        _displayAppOpenAd();
      }
    }
  }

  //Advertising Logic
  late AppOpenAd? _appOpenAd;

  final String _appOpenAdId = AppEnv.isProduction
      ? "ca-app-pub-4097712753507018/4582404575"
      : "ca-app-pub-3940256099942544/3419835294";

  bool _isShowingAd = false;

  void _loadAppOpenAd() async {
    await AppOpenAd.load(
      adUnitId: _appOpenAdId,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: await AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          _appOpenAd = null;
          // Handle the error.
          return;
        },
      ),
    );
  }

  void _displayAppOpenAd() async {
    if (!_isAdAvailable) {
      _loadAppOpenAd();
      return;
    }
    if (_isShowingAd) {
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = await FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        _loadAppOpenAd();
      },
    );
    await _appOpenAd!.show();
  }

  bool get _isAdAvailable {
    return _appOpenAd != null;
  }
}
