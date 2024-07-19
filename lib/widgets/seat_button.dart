import 'package:flutter/material.dart';

class SeatButton extends StatelessWidget {
  const SeatButton({
    super.key,
    required this.pressedSeats,
    required this.i1,
    required this.i2,
  });

  final List pressedSeats;
  final int i1;
  final int i2;

  @override
  Widget build(BuildContext context) {
    Color color;
    if (pressedSeats[i1][i2] == 'free') {
      color = const Color(0xFFFFFFFF);
    } else if (pressedSeats[i1][i2] == 'taken') {
      color = const Color(0xFFFF00E4);
    } else {
      color = const Color(0xFF403E5B);
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: color,
        //pressedSeats[i1][i2] == 'free' ? const Color(0xFFFFFFFF) : const Color(0xFFFF00E4),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
