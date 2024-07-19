import 'dart:math';

import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CreditCard extends StatelessWidget {
  const CreditCard(
      {super.key,
      required this.showFrontSide,
      required this.enteredCardNumber,
      required this.enteredCVV,
      required this.enteredMMYY});

  final text1 = '***';
  final String enteredCardNumber;
  final String enteredCVV;
  final String enteredMMYY;

  final bool showFrontSide;

  @override
  Widget build(BuildContext context) {
    Widget buildLayout({
      required Key key,
      required AssetImage image,
      required Widget child,
    }) {
      return Container(
        //width: MediaQuery.sizeOf(context).width * 0.5,
        key: key,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: child,
      );
    }

    Widget buildFront() {
      return buildLayout(
        key: const ValueKey(true),
        image: const AssetImage('assets/images/card_front.png'),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Chip_icon.svg',
                      width: 28.74,
                      height: 22,
                    ),
                    SvgPicture.asset(
                      'assets/images/paypass_icon.svg',
                      width: 17.58,
                      height: 22.33,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      enteredCardNumber,
                      style: textTheme['16'],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color(0xFFF9F9F9),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      enteredMMYY,
                      
                      style: textTheme['16'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildRear() {
      return buildLayout(
        key: const ValueKey(false),
        image: const AssetImage('assets/images/card_back.png'),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showFrontSide
                        ? SvgPicture.asset(
                            'assets/images/Chip_icon.svg',
                            width: 28.74,
                            height: 22,
                          )
                        : const Spacer(
                            flex: 1,
                          ),
                    showFrontSide
                        ? SvgPicture.asset(
                            'assets/images/paypass_icon.svg',
                            width: 17.58,
                            height: 22.33,
                          )
                        : const Spacer(
                            flex: 1,
                          ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '**** **** **** ****',
                      style: showFrontSide
                          ? textTheme['16']
                          : textTheme['16']!
                              .copyWith(color: Colors.transparent),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color(0xFFF9F9F9),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      enteredCVV,
                      style: textTheme['16'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget transitionBuilder(Widget widget, Animation<double> animation) {
      final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
      return AnimatedBuilder(
        animation: rotateAnim,
        child: widget,
        builder: (context, widget) {
          final isUnder = (ValueKey(showFrontSide) != widget!.key);
          var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
          tilt *= isUnder ? -1.0 : 1.0;
          final value =
              isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
          return Transform(
            transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
            alignment: Alignment.center,
            child: widget,
          );
        },
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1600),
      transitionBuilder: transitionBuilder,
      layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack.flipped,
      child: showFrontSide ? buildFront() : buildRear(),
    );
  }
}
