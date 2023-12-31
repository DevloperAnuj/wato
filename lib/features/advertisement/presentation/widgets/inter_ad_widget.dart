import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/config/service_locator.dart';
import 'package:wato/features/advertisement/presentation/manager/inter_ad_logic/inter_ad_logic_cubit.dart';
import 'package:wato/features/advertisement/presentation/widgets/inter_exit_popup.dart';

class InterAdWidget extends StatelessWidget {
  const InterAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator.get<InterAdLogicCubit>()..loadInterAd(context),
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return showExitPopup(context);
            },
            child: BlocBuilder<InterAdLogicCubit, InterAdLogicState>(
              builder: (context, state) {
                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
