import 'package:flutter/material.dart';
import '../widgets/signin_form.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: size.width * 0.7,
                  ),
                ),
                const SizedBox(height: 35),
                const SigninForm(),
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
