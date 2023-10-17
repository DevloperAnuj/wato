
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../config/app_env.dart';

part 'inter_ad_logic_state.dart';

class InterAdLogicCubit extends Cubit<InterAdLogicState> {
  InterAdLogicCubit() : super(InterAdLogicInitial());

  late InterstitialAd? _interstitialAd;

  final String _interAdId = AppEnv.isProduction
      ? "ca-app-pub-4097712753507018/8427895213"
      : "ca-app-pub-3940256099942544/1033173712";

  void loadInterAd(BuildContext context) async {
    emit(InterAdLogicLoading());
    await InterstitialAd.load(
      adUnitId: _interAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (err) {
          _interstitialAd = null;
          emit(InterAdLogicError(err: err.message));
        },
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          emit(InterAdLogicLoaded(interAd: ad));
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _interstitialAd = null;
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  void displayInterAd() async {
    if (_interstitialAd != null) {
      await _interstitialAd!.show();
    }
  }

  void disposeInterAd() async {
    await _interstitialAd!.dispose();
  }
}
