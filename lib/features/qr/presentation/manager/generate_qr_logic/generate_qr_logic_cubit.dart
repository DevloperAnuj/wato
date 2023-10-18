import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generate_qr_logic_state.dart';

class GenerateQrLogicCubit extends Cubit<String?> {
  GenerateQrLogicCubit() : super(null);

  String? _number;

  void createQrCode() async {
    emit(_number);
  }

  setNumber({required String number}){
    _number = number;
  }

}
