import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/app_env.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/advertisement/presentation/manager/app_open_ad_logic/app_open_ad_logic_cubit.dart';

class AppOpenAdWidget extends StatelessWidget {
  const AppOpenAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppEnv.forPersonal
        ? SizedBox.shrink()
        : BlocProvider(
            create: (context) => serviceLocator.get<AppOpenAdLogicCubit>()
              ..listenToAppStateChanges(),
            child: BlocBuilder<AppOpenAdLogicCubit, AppOpenAdLogicState>(
              builder: (context, state) {
                return SizedBox.shrink();
              },
            ),
          );
  }
}
