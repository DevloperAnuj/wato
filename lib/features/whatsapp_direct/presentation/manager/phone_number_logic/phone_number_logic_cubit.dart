import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_number_logic_state.dart';

class PhoneNumberLogicCubit extends Cubit<TextEditingController> {
  PhoneNumberLogicCubit() : super(TextEditingController());

  TextEditingController _phoneEditingController = TextEditingController();

  void setPhoneNumber() async {
    _phoneEditingController.value = state.value;
    emit(_phoneEditingController);
  }

  void phoneFromQrCode(String? text) {
    _phoneEditingController.text = text!;
    emit(_phoneEditingController);
  }
}
