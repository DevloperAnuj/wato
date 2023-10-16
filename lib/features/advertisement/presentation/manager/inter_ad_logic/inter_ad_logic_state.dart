part of 'inter_ad_logic_cubit.dart';

abstract class InterAdLogicState extends Equatable {
  const InterAdLogicState();
}

class InterAdLogicInitial extends InterAdLogicState {
  @override
  List<Object> get props => [];
}

class InterAdLogicLoading extends InterAdLogicState {
  @override
  List<Object> get props => [];
}

class InterAdLogicLoaded extends InterAdLogicState {
  final InterstitialAd interAd;
  @override
  List<Object> get props => [interAd];

  const InterAdLogicLoaded({
    required this.interAd,
  });
}

class InterAdLogicError extends InterAdLogicState {
  final String err;
  @override
  List<Object> get props => [err];

  const InterAdLogicError({
    required this.err,
  });
}
