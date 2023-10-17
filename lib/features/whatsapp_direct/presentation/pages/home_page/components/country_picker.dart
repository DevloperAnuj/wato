import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/country_code_logic/country_code_logic_cubit.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: BlocProvider(
        create: (context) => serviceLocator.get<CountryCodeLogicCubit>()
          ..getDefaultCountryCode(context),
        child: InkWell(
          onTap: () {
            context.read<CountryCodeLogicCubit>().selectCountryCode(context);
          },
          child: BlocBuilder<CountryCodeLogicCubit, Country?>(
            builder: (context, country) {
              return CircleAvatar(
                backgroundImage: country == null
                    ? null
                    : AssetImage(
                        country.flag,
                        package: countryCodePackageName,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
