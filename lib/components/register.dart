import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final key = GlobalKey<FormState>();
  String email = '', password = '', errorMessage = '';

  void signUpToFirebase(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Navigator.of(context).pushReplacementNamed('/'),
          );
    } on FirebaseException catch (error) {
      if (error.code == 'weak-password') {
        setState(() {
          errorMessage = 'The password provided is too weak.';
        });
      } else if (error.code == 'email-already-in-use') {
        setState(() {
          errorMessage = 'The account already exists for that email.';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            const Text('Register Form'),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  email = value!;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  password = value!;
                });
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  signUpToFirebase(email, password);
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 25,
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
              ),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/login'),
              child: const Text('Login form'),
            )
          ],
        ),
      ),
    );
  }
}
