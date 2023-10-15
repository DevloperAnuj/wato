import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class WhatsBusinessChoice extends StatefulWidget {
  const WhatsBusinessChoice({
    super.key,
  });

  @override
  State<WhatsBusinessChoice> createState() => _WhatsBusinessChoiceState();
}

class _WhatsBusinessChoiceState extends State<WhatsBusinessChoice> {

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    if (1 > 2) {
      return const SizedBox.shrink();
    }
    return ChipsChoice.single(
      value: _selected,
      choiceItems: const [
        C2Choice(
          value: 0,
          label: 'WhatsApp',
          style: C2ChipStyle(
            height: 40,
            backgroundOpacity: 0.3,
          ),
        ),
        C2Choice(
          value: 1,
          label: 'WhatsApp Business',
          style: C2ChipStyle(
            height: 40,
            backgroundOpacity: 0.3,
          ),
        )
      ],
      onChanged: (val) {
        setState(() {
          _selected = val;
        });
      },
    );
  }
}
