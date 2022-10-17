import 'package:flutter/material.dart';
import 'package:login_mysql/screens/register_screen.dart';
import 'package:login_mysql/services/isValidUser.dart';
import 'package:login_mysql/widgets/my_submit_button.dart';
import 'package:login_mysql/widgets/my_textfield.dart';

import '../widgets/my_textbutton.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
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
               MySubmitButton(
                      label: 'Login',
                      onPressed: () async {

                        if (_usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          //show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields')));
                          return;
                        }
                        //authenticate
                        isValidUser(_usernameController.text,
                                _passwordController.text)
                            .then((isValidUser) => {
                                  if (isValidUser)
                                    {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()))
                                    }
                                  else
                                    {
                                      //show snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Error Occurred.')))
                                    }
                                });
                      }),
              const SizedBox(height: 20),
              MyTextButton(
                  label: 'New User? Create new Account.',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                        (route) => false);
                  })
            ],
          ),
        ));
  }
}
