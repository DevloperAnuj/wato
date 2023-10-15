import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'message_logic_state.dart';

class MessageLogicCubit extends Cubit<String?> {

  MessageLogicCubit() : super("Hello from WAto");

  String _messageText = "";

  void setMessageText(String text) {
    _messageText = text;
    emit(_messageText);
  }
}
