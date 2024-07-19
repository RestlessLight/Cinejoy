import 'package:flutter/material.dart';

class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width * 3,
      width: MediaQuery.sizeOf(context).width * 3,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.05, 0.95],
          begin: Alignment(0, -1),
          end: Alignment(0, -0.8),
          colors: [
            Color.fromARGB(100, 255, 0, 230),
            Color.fromARGB(0, 255, 0, 230),
          ],
        ),
        shape: BoxShape.circle,
        border: Border(
          bottom: BorderSide(
            width: 12,
            color: Color(0xFFFF00E4),
          ),
          left: BorderSide(
            width: 12,
            color: Color(0xFFFF00E4),
          ),
          right: BorderSide(
            width: 12,
            color: Color(0xFFFF00E4),
          ),
          top: BorderSide(
            width: 12,
            color: Color(0xFFFF00E4),
          ),
        ),
      ),
    );
  }
}
