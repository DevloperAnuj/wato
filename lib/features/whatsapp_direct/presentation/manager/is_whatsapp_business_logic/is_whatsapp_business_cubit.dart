import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_whatsapp_business_state.dart';

class IsWhatsappBusinessCubit extends Cubit<IsWhatsappBusinessState> {
  IsWhatsappBusinessCubit() : super(IsWhatsappBusinessInitial());
}
