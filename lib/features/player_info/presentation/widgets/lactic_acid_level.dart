import 'package:fitpulse/features/player_info/presentation/widgets/state_cards.dart';
import 'package:flutter/material.dart';

class LacticAcidLevelWidget extends StatelessWidget {
  const LacticAcidLevelWidget({
    super.key,
    required double lacticAcidValue,
    required Stream<int> piezoKnockCountStream,
  })  : _lacticAcidValue = lacticAcidValue,
        _piezoKnockCountStream = piezoKnockCountStream;

  final double _lacticAcidValue;
  final Stream<int> _piezoKnockCountStream;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StateCards(
            title: "Lactic-Acid",
            value: "$_lacticAcidValue",
            imagePath: "assets/images/lactic.png"),
        StreamBuilder<int>(
          stream: _piezoKnockCountStream,
          builder: (context, snapshot) {
            return StateCards(
                title: "Breath",
                value: "${snapshot.data ?? 0}",
                imagePath: "assets/images/breath.png");
          },
        ),
      ],
    );
  }
}
