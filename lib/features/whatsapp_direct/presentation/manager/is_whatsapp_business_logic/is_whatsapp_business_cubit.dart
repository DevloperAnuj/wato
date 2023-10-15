import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_whatsapp_business_state.dart';

class IsWhatsappBusinessCubit extends Cubit<int> {
  IsWhatsappBusinessCubit() : super(0);

  void togglePackage(int i) {
    emit(i);
  }

}
