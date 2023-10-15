import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_package_logic_state.dart';

class CheckPackageLogicCubit extends Cubit<CheckPackageLogicState> {
  CheckPackageLogicCubit() : super(CheckPackageLogicInitial());
}
