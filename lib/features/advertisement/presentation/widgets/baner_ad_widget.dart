import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wato/config/app_env.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/advertisement/presentation/manager/banner_ad_logic/banner_ad_logic_cubit.dart';

class MyBannerAdWidget extends StatelessWidget {
  const MyBannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator.get<BannerAdLogicCubit>()..initBannerAd(),
      child: Builder(builder: (context) {
        return BlocBuilder<BannerAdLogicCubit, BannerAdLogicState>(
          builder: (context, adState) {
            if (adState is BannerAdLogicLoading) {
              return AppEnv.isProduction
                  ? SizedBox.shrink()
                  : LinearProgressIndicator();
            }
            if (adState is BannerAdLogicError) {
              return AppEnv.isProduction
                  ? Text(adState.err)
                  : SizedBox.shrink();
            }
            if (adState is BannerAdLogicLoaded) {
              return SizedBox(
                width: adState.ad.size.width.toDouble(),
                height: adState.ad.size.height.toDouble(),
                child: AdWidget(ad: adState.ad),
              );
            }
            return SizedBox.shrink();
          },
        );
      }),
    );
  }
}
