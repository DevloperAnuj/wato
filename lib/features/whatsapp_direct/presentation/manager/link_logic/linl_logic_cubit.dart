import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'linl_logic_state.dart';

class LinkLogicCubit extends Cubit<String?> {
  LinkLogicCubit() : super(null);

  String? _linkText;

  void setLinkText(String text) {
    _linkText = text;
    emit(_linkText);
  }

}
