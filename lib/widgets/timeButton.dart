import 'package:flutter/material.dart';

import 'package:cinejoy/theme/textStyle.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({
    super.key,
    required this.time,
    required this.selectedIndexTime,
    required this.index,
  });

  final String time;
  final int selectedIndexTime;

  final int index;

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: widget.selectedIndexTime == widget.index
            ? const Color(0xFFFF00E4)
            : const Color(0xFF2E2C43),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 71,
      height: 41,
      child: Center(
        child: Text(
          widget.time,
          style: widget.selectedIndexTime == widget.index
              ? textTheme['13']!.copyWith(
                  color: const Color(0xFF000000),
                )
              : textTheme['13'],
        ),
      ),
    );
  }
}
