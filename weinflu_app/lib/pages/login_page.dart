import 'package:flutter/material.dart';
import 'package:weinflu_app/design/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final borderActive =
      Border.all(color: WeinFluColors.brandPrimaryColor, width: 2);
  final borderInactive = Border.all(color: Colors.transparent);
  late Border borderBoxUser;
  late Border borderBoxPass;
  @override
  void initState() {
    super.initState();
    borderBoxPass = borderInactive;
    borderBoxUser = borderInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 8),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Hello',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                )),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      margin: EdgeInsets.fromLTRB(8, 54, 8, 28),
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          border: borderBoxUser,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: WeinFluColors.brandSecondaryColor),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            borderBoxUser = borderActive;
                            borderBoxPass = borderInactive;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            borderBoxUser = borderInactive;
                          });
                        },
                        style: Theme.of(context).textTheme.labelSmall,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un valor';
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                                color: WeinFluColors.brandLigthDarkColor,
                                fontWeight: FontWeight.w200)),
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 24),
                      padding: EdgeInsets.only(left: 16, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: borderBoxPass,
                          color: WeinFluColors.brandSecondaryColor),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un valor';
                          }
                          return null;
                        },
                        onTap: () {
                          setState(() {
                            borderBoxPass = borderActive;
                            borderBoxUser = borderInactive;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            borderBoxPass = borderInactive;
                          });
                        },
                        obscureText: true,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: WeinFluColors.brandLigthDarkColor,
                            )),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (currentValue) {
                            print(currentValue);
                            setState(() {
                              isChecked = currentValue!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          activeColor: WeinFluColors.brandPrimaryColor,
                        ),
                        Expanded(child: Text('Remember me')),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: TextButton(
                            child: Text(
                              'Recovery Password',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: WeinFluColors.brandLigthDarkColor,
                                  fontWeight: FontWeight.w200),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 16.0, right: 14.0),
                            child: Divider(
                              color: WeinFluColors.brandPrimaryColor,
                            )),
                      ),
                      Text("Or continue with"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 14.0, right: 16.0),
                            child: Divider(
                              color: WeinFluColors.brandPrimaryColor,
                            )),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 46),
                      child: Row(children: []),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(364, 64),
                          backgroundColor: WeinFluColors.brandPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
