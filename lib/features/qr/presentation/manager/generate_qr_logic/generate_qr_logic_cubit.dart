import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generate_qr_logic_state.dart';

class GenerateQrLogicCubit extends Cubit<GenerateQrLogicState> {
  GenerateQrLogicCubit() : super(GenerateQrLogicInitial());
}
