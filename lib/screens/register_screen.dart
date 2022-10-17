import 'package:flutter/material.dart';
import 'package:login_mysql/screens/home_screen.dart';
import 'package:login_mysql/screens/login_screen.dart';

import '../services/createUser.dart';
import '../widgets/my_submit_button.dart';
import '../widgets/my_textbutton.dart';
import '../widgets/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              textEditingController: _usernameController,
              labelText: 'Username',
            ),
            const SizedBox(height: 10),
            MyTextField(
              textEditingController: _passwordController,
              labelText: 'Password',
            ),
            const SizedBox(height: 10),
            MyTextField(
              textEditingController: _confirmPasswordController,
              labelText: 'Confirm Password',
            ),
            const SizedBox(height: 10),
            MySubmitButton(
              label: 'Register Yourself',
              onPressed: () async {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _confirmPasswordController.text.isEmpty) {
                  //show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')));
                  return;
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  //show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Passwords do not match.')));
                  return;
                }

                //insert new user details
                createUser(_usernameController.text, _passwordController.text)
                    .then((customResponse) => {
                          if (customResponse.status!)
                            {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()))
                            }
                          else
                            {
                              //show snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                      content: Text('Error '+customResponse.message!)))
                            }
                        });
              },
            ),
            const SizedBox(height: 20),
            MyTextButton(
                label: 'Already have an account ? Log In.',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                })
          ],
        ),
      ),
    );
  }
}
