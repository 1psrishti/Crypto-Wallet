import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:crypto_wallet/ui/home_screen.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CRYPTO-WALLET",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                controller: _emailField,
                decoration: InputDecoration(
                  hintText: "something@email.com",
                  hintStyle: TextStyle(
                    color: Colors.deepPurple[200],
                  ),
                  labelText: "Email",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Your password",
                  hintStyle: TextStyle(
                    color: Colors.deepPurple[200],
                  ),
                  labelText: "Password",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.purpleAccent,
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.purpleAccent,
              ),
              child: MaterialButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await signIn(_emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
