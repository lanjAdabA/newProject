import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newproject/routers/router.gr.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.purple[50], body: SigninForm());
  }
}

class SigninForm extends StatelessWidget {
  final _formkey = GlobalKey();

  SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "hello !",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(height: 10),
          const Text("this is a SAMPLE login PAGE"),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: TextFormField(
                validator: (value) => null,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "User Name / E-mail"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: TextFormField(
                validator: (value) => null,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Password"),
                obscureText: true,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.00),
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const ContentHomeRoute());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple)),
                child: const Text(
                  "sign in",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Not a Member ?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  context.router.push(const SignUpRoute());
                },
                child: const Text(
                  "REGISTER NOW",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
