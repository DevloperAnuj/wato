part of 'save_qr_logic_cubit.dart';

abstract class SaveQrLogicState extends Equatable {
  const SaveQrLogicState();
}

class SaveQrLogicInitial extends SaveQrLogicState {
  @override
  List<Object> get props => [];
}

class SaveQrLogicLoading extends SaveQrLogicState {
  @override
  List<Object> get props => [];
}

class SaveQrLogicFailed extends SaveQrLogicState {
  final String err;

  @override
  List<Object> get props => [err];

  const SaveQrLogicFailed({
    required this.err,
  });
}

class SaveQrLogicSuccess extends SaveQrLogicState {
  @override
  List<Object?> get props => [];
}
