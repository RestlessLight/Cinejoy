import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PayWithButton extends StatelessWidget {
  const PayWithButton({
    super.key,
    required this.imgPath,
  });

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: const Color(0x40FF00E4),
        onTap: () {
          print('text');
        },
        child: Container(
          // padding: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Color(0xFFFFFFFF),
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          height: 60,
          child: Align(
            alignment: Alignment.center
            ,
            child: SvgPicture.asset(
              imgPath,
              height: 20.92,
              width: 17,
            ),
          ),
        ),
      ),
    );
  }
}
