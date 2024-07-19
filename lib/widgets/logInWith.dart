import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/material.dart';



import 'package:flutter_svg/flutter_svg.dart';

class LogInWithButton extends StatelessWidget {
  const LogInWithButton(
      {super.key,
      required this.imgPath,
      required this.text,
      required this.isLogin});

  final String text;
  final String imgPath;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor:
            isLogin ? const Color(0x40FF00E4) : const Color(0xFFA555EC),
        onTap: () {
          print('text');
        },
        child: Container(
          padding: const EdgeInsets.only(left: 20),
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    imgPath,
                    height: 20.92,
                    width: 17,
                  ),
                ),
              ),
              Center(
                child: Text(
                  isLogin ? 'Log In with $text' : 'Sign Up with $text',
                  style: textTheme['14'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
