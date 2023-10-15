import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'country_code_logic_state.dart';

class CountryCodeLogicCubit extends Cubit<Country?> {
  CountryCodeLogicCubit() : super(null);

  void getDefaultCountryCode(BuildContext ctx) async {
    final country = await getDefaultCountry(ctx);
    emit(country);
  }

  void selectCountryCode(BuildContext ctx) async {
    final country = await showCountryPickerSheet(ctx);
    if (country != null) {
      emit(country);
    }
  }

}
