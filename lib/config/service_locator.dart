import 'package:get_it/get_it.dart';
import 'package:wato/features/advertisement/presentation/manager/app_open_ad_logic/app_open_ad_logic_cubit.dart';
import 'package:wato/features/advertisement/presentation/manager/banner_ad_logic/banner_ad_logic_cubit.dart';
import 'package:wato/features/advertisement/presentation/manager/inter_ad_logic/inter_ad_logic_cubit.dart';
import 'package:wato/features/update/presentation/manager/check_update_logic/check_update_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/check_package_logic/check_package_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/country_code_logic/country_code_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/is_whatsapp_business_logic/is_whatsapp_business_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/link_logic/linl_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/message_logic/message_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/phone_number_logic/phone_number_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/pick_files_logic/pick_files_logic_cubit.dart';
import 'package:wato/features/whatsapp_direct/presentation/manager/to_whatsapp_logic/to_whatsapp_logic_cubit.dart';

final serviceLocator = GetIt.instance;

initSetup() {
  //*Registering Cubits
  //For WhatsApp Direct Feature
  serviceLocator.registerLazySingleton<CheckPackageLogicCubit>(
    () => CheckPackageLogicCubit(),
  );
  serviceLocator.registerLazySingleton<CountryCodeLogicCubit>(
    () => CountryCodeLogicCubit(),
  );
  serviceLocator.registerLazySingleton<IsWhatsappBusinessCubit>(
    () => IsWhatsappBusinessCubit(),
  );
  serviceLocator.registerLazySingleton<LinkLogicCubit>(
    () => LinkLogicCubit(),
  );
  serviceLocator.registerLazySingleton<MessageLogicCubit>(
    () => MessageLogicCubit(),
  );
  serviceLocator.registerLazySingleton<PhoneNumberLogicCubit>(
    () => PhoneNumberLogicCubit(),
  );
  serviceLocator.registerLazySingleton<PickFilesLogicCubit>(
    () => PickFilesLogicCubit(),
  );
  serviceLocator.registerLazySingleton<ToWhatsappLogicCubit>(
    () => ToWhatsappLogicCubit(),
  );

  //For Update Feature
  serviceLocator.registerFactory<CheckUpdateLogicCubit>(
    () => CheckUpdateLogicCubit(),
  );

  //For Advertisement Feature
  serviceLocator.registerLazySingleton<AppOpenAdLogicCubit>(
    () => AppOpenAdLogicCubit(),
  );
  serviceLocator.registerFactory<BannerAdLogicCubit>(
    () => BannerAdLogicCubit(),
  );
  serviceLocator.registerLazySingleton<InterAdLogicCubit>(
    () => InterAdLogicCubit(),
  );

  //For Monetization Feature


  //For Generate QR logic


}
