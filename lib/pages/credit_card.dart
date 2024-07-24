import 'package:cinejoy/textFormatter/textFormatter.dart';
import 'package:cinejoy/theme/textStyle.dart';
import 'package:cinejoy/widgets/credit_card.dart';
import 'package:cinejoy/widgets/payWithButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() {
    return _CreditCardPageState();
  }
}

class _CreditCardPageState extends State<CreditCardPage> {
  late bool _showFrontSide;

  String _enteredCardNumber = '**** **** **** ****';
  String _enteredMMYY = 'MM/YY';
  String _enteredCVV = 'CVV';

  final _form = GlobalKey<FormState>();

  var formBorderStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  //late bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    //_flipXAxis = true;
  }

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
                      color: Color.fromARGB(192, 255, 0, 230),
                      blurRadius: 300,
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Payment',
                          style: textTheme['16'],
                        ),
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.transparent,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showFrontSide = !_showFrontSide;
                      });
                    },
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      child: AspectRatio(
                        aspectRatio: 1.423,
                        child: CreditCard(
                          enteredMMYY: _enteredMMYY,
                          enteredCVV: _enteredCVV,
                          enteredCardNumber: _enteredCardNumber,
                          showFrontSide: _showFrontSide,
                        ),
                      ),
                    ),
                  ),
                  
                  Form(
                    key: _form,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        

                        TextFormField(
                          inputFormatters: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx xxxx xxxx xxxx',
                              separator: ' ',
                            ),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: formBorderStyle,
                            focusedBorder: formBorderStyle,
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            alignLabelWithHint: true,
                            label: Text(
                              '   Card Number',
                              style: textTheme['16']!.copyWith(
                                color: const Color(0xFF191825),
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length != 16) {
                              return 'Please enter at least 16 charecters.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _enteredCardNumber = value;
                            });
                          },
                          onSaved: (value) {
                            //_eneteredUsername = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: (MediaQuery.sizeOf(context).width * 0.7),
                              child: TextFormField(
                                inputFormatters: [
                                  MaskedTextInputFormatter(
                                    mask: 'xx/yy',
                                    separator: '/',
                                  ),
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: formBorderStyle,
                                  focusedBorder: formBorderStyle,
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  alignLabelWithHint: true,
                                  label: Text(
                                    '   MM/YY',
                                    style: textTheme['16']!.copyWith(
                                      color: const Color(0xFF191825),
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                                keyboardType: TextInputType.number,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _enteredMMYY = value;
                                  });
                                },
                                onSaved: (value) {
                                  //_eneteredEmail = value!;
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width:
                                  (MediaQuery.sizeOf(context).width * 0.3) - 10,
                              child: TextFormField(
                                inputFormatters: [
                                  MaskedTextInputFormatter(
                                    mask: 'xxx',
                                    separator: '',
                                  ),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: formBorderStyle,
                                  focusedBorder: formBorderStyle,
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  alignLabelWithHint: true,
                                  label: Text(
                                    '   CVV',
                                    style: textTheme['16']!.copyWith(
                                      color: const Color(0xFF191825),
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 3) {
                                    return 'Password must be at least 3 charecters long.';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _enteredCVV = value;
                                  });
                                },
                                onSaved: (value) {
                                  // _eneteredPassword = value!;
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: const Divider(
                                  color: Color(0xFFFFFFFF),
                                  thickness: 1,
                                ),
                              ),
                            ),
                            Text(
                              'or',
                              style: textTheme['14'],
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: const Divider(
                                  color: Color(0xFFFFFFFF),
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PayWithButton(imgPath: 'assets/images/logos_google-pay.svg'),
                        const SizedBox(
                          height: 10,
                        ),
                        const PayWithButton(imgPath: 'assets/images/logos_apple-pay.svg'),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price:',
                                    style: textTheme['16'],
                                  ),
                                  Text(
                                    '\$100.00',
                                    style: textTheme['16 bold'],
                                  ),
                                ],
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF00E4),
                                  minimumSize: Size(
                                      MediaQuery.sizeOf(context).width * 0.66,
                                      60),
                                  maximumSize: Size(
                                      MediaQuery.sizeOf(context).width * 0.66,
                                      60),
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
                                  'Buy Ticket',
                                  style: textTheme['16 bold']!.copyWith(
                                    color: const Color(0xFF191825),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
