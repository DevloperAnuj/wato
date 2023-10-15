import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_number_logic_state.dart';

class PhoneNumberLogicCubit extends Cubit<String?> {
  PhoneNumberLogicCubit() : super(null);

  String? _phoneNumber;

  void setPhoneNumber(String text) {
    _phoneNumber = text;
    emit(_phoneNumber);
  }

}
