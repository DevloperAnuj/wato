import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/service_locator.dart';
import '../../../../../qr/presentation/manager/scan_qr_logic/scan_qr_logic_cubit.dart';
import '../../../manager/phone_number_logic/phone_number_logic_cubit.dart';

class QRScanButton extends StatelessWidget {
  const QRScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScanQrLogicCubit(),
        ),
        BlocProvider.value(
          value: serviceLocator.get<PhoneNumberLogicCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<ScanQrLogicCubit, String?>(
            listener: (context, qrText) {
              if (qrText != null) {
                context.read<PhoneNumberLogicCubit>().phoneFromQrCode(qrText);
              }
            },
            child: IconButton(
              onPressed: () {
                context.read<ScanQrLogicCubit>().scanQRCode(context);
              },
              icon: Icon(
                Icons.qr_code_2,
                size: 35,
              ),
            ),
          );
        },
      ),
    );
  }
}