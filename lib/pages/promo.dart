import 'package:cinejoy/pages/auth.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.topLeft,
                image: AssetImage('assets/images/horses.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Your Portal to Cinematic Excitement',
                  style: textTheme['40'],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Embark on a thrilling journey into the world of cinema with TicketFlix, your ultimate destination for securing tickets to the hottest movies!',
                  style: textTheme['16'],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: const Color(0x40FF00E4),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const AuthScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 40, right: 10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFF00E4),
                              blurRadius: 82.5,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          color: Color(0xFFFF00E4),
                        ),
                        height: 70,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start now',
                              style: textTheme['16']!.copyWith(
                                color: const Color(0xFF191825),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Icon(
                              Icons.play_circle_fill,
                              color: Color(0xFF191825),
                              size: 41,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
