import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wato/config/app_env.dart';

part 'banner_ad_logic_state.dart';

class BannerAdLogicCubit extends Cubit<BannerAdLogicState> {
  BannerAdLogicCubit() : super(BannerAdLogicInitial());

  late BannerAd? _bannerAd;

  final String _bannerAdId = AppEnv.isProduction
      ? "ca-app-pub-4097712753507018/2811772303"
      : "ca-app-pub-3940256099942544/6300978111";

  initBannerAd() async {
    emit(BannerAdLogicLoading());
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: _bannerAdId,
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          emit(BannerAdLogicError(err: err.message));
        },
        onAdLoaded: (ad) async {
          emit(BannerAdLogicLoaded(ad: _bannerAd!));
        },
      ),
      request: const AdRequest(),
    );
    displayBannerAd();
  }

  displayBannerAd() async {
    if (_bannerAd != null) {
      await _bannerAd!.load();
    }
  }

  disposeBannerAd() async {
    await _bannerAd!.dispose();
  }
}
