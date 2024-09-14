import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lehrium_flutter/views/widgets/my_button.dart';
import 'package:lehrium_flutter/views/widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _untisController = TextEditingController();


  void signUserIn() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome to Lehrium"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(  // Wrap the entire body inside a SingleChildScrollView
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.book, size: 100),
                const SizedBox(height: 50),
                Text(
                  "Welcome to Lehrium.\n Let's create you an account",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                MyTextField(
                    controller: _usernameController,
                    obscureText: false,
                    hintText: "Enter your Email"),
                const SizedBox(height: 10),
                MyTextField(
                    controller: _untisController,
                    obscureText: false,
                    hintText: "Enter your Untis Name"),
                const SizedBox(height: 10),
                MyTextField(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: "Enter your Password"),
                const SizedBox(height: 20),
                MyButton(
                  onTap: signUserIn,
                  text: "Sign Up",
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.22),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a Member?"),
                    const SizedBox(width: 4),
                    Text("Sign in now",
                        style: TextStyle(color: Theme.of(context).primaryColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
