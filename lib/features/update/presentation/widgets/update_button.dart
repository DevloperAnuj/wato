import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wato/features/update/presentation/manager/check_update_logic/check_update_logic_cubit.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckUpdateLogicCubit()..checkUpdate(),
      child: Builder(builder: (context) {
        return BlocBuilder<CheckUpdateLogicCubit, CheckUpdateLogicState>(
          builder: (context, state) {
            if (state is CheckUpdateLogicUpdate) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            }
            return SizedBox.shrink();
          },
        );
      }),
    );
  }
}
