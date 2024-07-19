import 'package:flutter/material.dart';

import 'package:cinejoy/theme/textStyle.dart';

class DayButton extends StatefulWidget {
  const DayButton({
    super.key,
    required this.date,
    required this.selectedIndex,
    required this.id,
    required this.index,
    required this.dayName,
    required this.dayNumber,
  });

  final DateTime date;
  final int selectedIndex;
  final String id;
  final int index;
  final String dayName;
  final String dayNumber;

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 82,
      width: 53,
      decoration: BoxDecoration(
        color: widget.selectedIndex == widget.index
            ? const Color(0xFFFF00E4)
            : const Color(0xFF2E2C43),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.dayName,
            style: widget.selectedIndex == widget.index
                ? textTheme['13']!.copyWith(
                    color: const Color(0xFF000000),
                  )
                : textTheme['13'],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF191825),
            ),
            child: Center(
              child: Text(
                widget.dayNumber,
                style: textTheme['13'],
              ),
            ),
          )
        ],
      ),
    );
  }
}
