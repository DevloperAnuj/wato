import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({
    super.key,
  });

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    initCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          _showCountryPicker();
        },
        child: CircleAvatar(
          backgroundImage: _selectedCountry == null
              ? null
              : AssetImage(
            _selectedCountry!.flag,
            package: countryCodePackageName,
          ),
        ),
      ),
    );
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(context);
    if (country != null) {
      setState(() {
        _selectedCountry = country;
        print(_selectedCountry!.callingCode.substring(1));
      });
    }
  }
}