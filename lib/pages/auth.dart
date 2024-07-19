import 'dart:ui';

import 'package:cinejoy/theme/textStyle.dart';
import 'package:cinejoy/widgets/logInWith.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  bool _isLogin = true;
  bool _passwordVisible = true;
  var _eneteredUsername = '';
  var _eneteredEmail = '';
  var _eneteredPassword = '';
  var _isAuthenticating = false;

  var formBorderStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  void _submit() async {
    final isValid = _form.currentState!.validate();

    // ignore: unnecessary_null_comparison
    if (!isValid || !_isLogin == null) {
      //show error message
      return;
    }

    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        
        // ignore: unused_local_variable
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _eneteredEmail, password: _eneteredPassword);
      } else {
        
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _eneteredEmail, password: _eneteredPassword);


        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _eneteredUsername,
          'email': _eneteredEmail,
          'image_url': ''
        });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        //....
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF191825),
            ),
          ),
          Positioned(
            top: -328,
            left: -280,
            child: Container(
              height: MediaQuery.sizeOf(context).width * 1.14,
              width: MediaQuery.sizeOf(context).width * 1.14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    color: _isLogin
                        ? const Color(0x40FF00E4)
                        : const Color(0x4DA555EC),
                    blurRadius: 200,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -420,
            left: 58,
            child: Container(
              height: MediaQuery.sizeOf(context).width * 1.14,
              width: MediaQuery.sizeOf(context).width * 1.14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    color: _isLogin
                        ? const Color(0x40FF00E4)
                        : const Color(0x4DA555EC),
                    blurRadius: 200,
                  )
                ],
              ),
            ),
          ),
          // SizedBox.expand(
          //   child:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _form,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      _isLogin ? 'Log In' : 'Sign In',
                      style: textTheme['40'],
                    ),
                    const SizedBox(height: 30),
                    if (!_isLogin)
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: formBorderStyle,
                          focusedBorder: formBorderStyle,
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          alignLabelWithHint: true,
                          label: Text(
                            '   Username',
                            style: textTheme['16']!.copyWith(
                              color: const Color(0xFF191825),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        enableSuggestions: false,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 4) {
                            return 'Please enter at least 4 charecters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _eneteredUsername = value!;
                        },
                      ),
                    if (!_isLogin) const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        alignLabelWithHint: true,
                        label: Text(
                          '   Email',
                          style: textTheme['16']!.copyWith(
                            color: const Color(0xFF191825),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _eneteredEmail = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        alignLabelWithHint: true,
                        label: Text(
                          '   Password',
                          style: textTheme['16']!.copyWith(
                            color: const Color(0xFF191825),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Password must be at least 6 charecters long.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _eneteredPassword = value!;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password ?',
                          style: textTheme['14'],
                        ),
                      ),
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
                      height: 45,
                    ),
                    LogInWithButton(
                        imgPath: 'assets/images/google.svg',
                        text: 'Google',
                        isLogin: _isLogin),
                    const SizedBox(height: 15),
                    LogInWithButton(
                        imgPath: 'assets/images/facebook.svg',
                        text: 'Fcaebook',
                        isLogin: _isLogin),
                    const SizedBox(height: 15),
                    LogInWithButton(
                        imgPath: 'assets/images/apple.svg',
                        text: 'Apple',
                        isLogin: _isLogin),
                    const SizedBox(height: 45),
                    if (_isAuthenticating) const CircularProgressIndicator(),
                    if (!_isAuthenticating)
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _isLogin
                              ? const Color(0xFFFF00E4)
                              : const Color(0xFFA555EC),
                          minimumSize: const Size(
                            double.infinity,
                            56,
                          ),
                        ),
                        onPressed: _submit,
                        child: _isLogin == true
                            ? Text(
                                'Log In',
                                style: textTheme['16 bold']!.copyWith(
                                  color: const Color(0xFF191825),
                                ),
                              )
                            : Text(
                                'Sign In',
                                style: textTheme['16 bold']!.copyWith(
                                  color: const Color(0xFF191825),
                                ),
                              ),
                      ),
                    // const SizedBox(height: 10),
                    if (!_isAuthenticating)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? 'Create Account' : 'Log In',
                          style: textTheme['14'],
                        ),
                      ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
          //)
        ],
      ),
    );
  }
}
