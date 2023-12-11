import 'dart:ffi';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState()
  {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "";
  String password = "";
  String firstnamevalue = "";
  String? test = null;



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Form(
          key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                          {
                            return "Please enter your first name";
                          }
                        else
                          {
                            firstnamevalue = value;
                            print (value);
                          }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                      ),
                      keyboardType: TextInputType.text

                    ),
                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter your last name";
                          }
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      ),
                      keyboardType: TextInputType.text
                    ),
                    TextFormField(
                      validator: (value)
                      {
                        if (value == null || value.isEmpty)
                        {
                          return "Please enter your age";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: true,
                      ),
                    ),
                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter your instrument";
                          }
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Instrument',
                      ),
                      keyboardType: TextInputType.text
                    ),

                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter your skill level";
                          }
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Skill Level',
                      ),
                      keyboardType: TextInputType.text
                    ),
                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter some text";
                          }
                          else if (!value.contains("@"))
                            {
                              return "Please include the @ symbol!";
                            }
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress
                    ),
                    TextFormField(
                        validator: (value)
                        {
                          if (value == null || value.isEmpty)
                          {
                            return "Please enter a password";
                          }
                          else if (value.length <= 8)
                            {
                              return "Length of password must be 8 or more";
                            }
                        },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      keyboardType: TextInputType.visiblePassword
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hang on while we register you...')),
                          );
                        }

                      },
                      child: const Text('Submit'),
                    ),
                  ],
                )
            )
        )
    );
  }

}
