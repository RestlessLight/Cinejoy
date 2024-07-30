import 'package:cinejoy/pages/movies.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:flutter/material.dart';



class PaymentResultPage extends StatelessWidget {
  const PaymentResultPage({super.key,});

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF191825),
              ),
            ),
            Positioned(
              top: -MediaQuery.sizeOf(context).width * 0.7,
              left: MediaQuery.sizeOf(context).width * 0.5,
              child: Container(
                height: MediaQuery.sizeOf(context).width * 1,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      color: Color.fromARGB(120, 255, 0, 230),
                      blurRadius: 300,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).width * 1.7,
              right: MediaQuery.sizeOf(context).width * 0.5,
              child: Container(
                height: MediaQuery.sizeOf(context).width * 1,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      color: Color.fromARGB(120, 255, 0, 230),
                      blurRadius: 100,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Payment Successful!',
                    style: textTheme['40'],
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Thank you for choosing our movie theater. Have a nice viewing',
                    style: textTheme['16'],
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF00E4),
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width * 0.55, 70),
                      maximumSize:
                          Size(MediaQuery.sizeOf(context).width * 0.55, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                    ),
                    onPressed: () {
                      //  tickeCount>0 ? Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (ctx) => CreditCardPage(),
                      //         ),
                      //       ) : () {};
                    },
                    child: Text(
                      'See Ticket',
                      style: textTheme['16 bold']!.copyWith(
                        color: const Color(0xFF191825),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const MoviesPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Go home',
                      style: textTheme['14'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
