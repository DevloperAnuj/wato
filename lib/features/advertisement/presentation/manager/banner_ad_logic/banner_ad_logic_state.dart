part of 'banner_ad_logic_cubit.dart';

abstract class BannerAdLogicState extends Equatable {
  const BannerAdLogicState();
}

class BannerAdLogicInitial extends BannerAdLogicState {
  @override
  List<Object> get props => [];
}

class BannerAdLogicLoading extends BannerAdLogicState {
  @override
  List<Object> get props => [];
}

class BannerAdLogicLoaded extends BannerAdLogicState {

  final BannerAd ad;

  @override
  List<Object> get props => [ad];

  const BannerAdLogicLoaded({
    required this.ad,
  });
}

class BannerAdLogicError extends BannerAdLogicState {
  final String err;
  @override
  List<Object> get props => [err];

  const BannerAdLogicError({
    required this.err,
  });
}
