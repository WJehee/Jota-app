import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
    runApp(const MyApp());
}

class LoginForm extends StatefulWidget {
    const LoginForm({super.key});

    @override
        State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    final _formKey = GlobalKey<FormState>();

    @override
        Widget build(BuildContext context) {
            return Form(
                    key: _formKey,
                    child: Column(children: [
                        TextFormField(validator: (v) {
                            if (v == null || v.isEmpty) {
                            return "please enter some text";
                            }
                            return null;
                            }),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                                onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Processing data'))
                                        );
                                    }
                                },
                                child: const Text('Submit'))
                            )
                    ],)
                    );
        }
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
        Widget build(BuildContext context) {
            return MaterialApp(
                    title: 'Jota rally app',
                    home: Scaffold(
                        appBar: AppBar(
                            title: const Text('Jota rally app'),
                            ),
                        body: const Center(
                            child: LoginForm(),
                            ),
                        ),
                    );
        }
}
