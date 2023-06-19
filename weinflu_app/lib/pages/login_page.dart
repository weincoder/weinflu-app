import 'package:flutter/material.dart';
import 'package:weinflu_app/config/app_routes.dart';
import 'package:weinflu_app/config/providers/user_provider.dart';
import 'package:weinflu_app/design/colors.dart';
import 'package:weinflu_app/design/copys.dart';
import 'package:weinflu_app/design/radius.dart';
import 'package:weinflu_app/widgets/divider_with_text.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  var userInputController = TextEditingController();
  late String userName;
  double expectedTitlesize=55;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultContainerInputDecoration = const BoxDecoration(
      color: WeinFluColors.brandSecondaryColor,
      borderRadius: BorderRadius.all(WeinFluRadius.small));
  final activeContainerInputDecoration = BoxDecoration(
      color: WeinFluColors.brandSecondaryColor,
      border: Border.all(color: WeinFluColors.brandPrimaryColor, width: 2),
      borderRadius: const BorderRadius.all(WeinFluRadius.small));
  final defaultInputLabelTheme = const TextStyle(
      fontSize: 13,
      color: WeinFluColors.brandLigthDarkColor,
      fontWeight: FontWeight.normal);
  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeinFluColors.brandLightBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
            child: Column(children: [
              TweenAnimationBuilder(tween: Tween<double> (begin: 13, end:expectedTitlesize), duration: Duration(milliseconds: 2000), builder: (context,sizeText,_){
                return  Text(
                WeinfluCopys.hello,
                style: TextStyle(fontSize: sizeText, color: WeinFluColors.brandPrimaryColor, fontWeight: FontWeight.bold),
              );
              },
              onEnd: (){
                setState(() {
                  expectedTitlesize = expectedTitlesize ==55 ? 13:55;
                });
              },
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                child: Text(
                  WeinfluCopys.lorem,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                  key: _formLoginKey,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(left: 24, bottom: 4),
                        decoration: userContainerDecoration,
                        child: TextFormField(
                            controller: userInputController,
                            style: Theme.of(context).textTheme.labelSmall,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return WeinFluErrors.userError;
                              }
                              if (value.length >= 10) {
                                return WeinFluErrors.userErrorLen;
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                userContainerDecoration =
                                    activeContainerInputDecoration;
                                pswContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                userContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onSaved: (userNameValue) {
                              userName = userNameValue!;
                            },
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label: Text(WeinfluCopys.userInputLabel,
                                    style: defaultInputLabelTheme))),
                      ),
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(left: 24, bottom: 4),
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        decoration: pswContainerDecoration,
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return WeinFluErrors.userPsw;
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                pswContainerDecoration =
                                    activeContainerInputDecoration;
                                userContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            onTapOutside: (event) {
                              setState(() {
                                pswContainerDecoration =
                                    defaultContainerInputDecoration;
                              });
                            },
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                border: defaultInputBorder,
                                label: const Text(WeinfluCopys.userPswInputLabel),
                                labelStyle: defaultInputLabelTheme)),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            value: checkBoxState,
                            onChanged: (value) {
                              setState(() {
                                checkBoxState = !checkBoxState;
                              });
                            },
                            checkColor: WeinFluColors.brandLightColor,
                            activeColor: WeinFluColors.brandPrimaryColor,
                          ),
                          const Expanded(child: Text(WeinfluCopys.rememberMe)),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              WeinfluCopys.recoveryPassword,
                              style: defaultInputLabelTheme,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32, bottom: 48),
                        width: 394,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formLoginKey.currentState!.validate()) {
                              print('Todos lo campos estan ok 🤯');
                              // _formLoginKey.currentState!.save();
                              userName = userInputController.text;
                              UserProvider.of(context).userData.name = userName;
                              Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.home);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: WeinFluColors.brandPrimaryColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(WeinFluRadius.small))),
                          child: const Text(WeinfluCopys.logIn),
                        ),
                      ),
                      const DividerWithText(title: WeinfluCopys.orContinue),
                      const SizedBox(
                        height: 42,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 189,
                            height: 69,
                            decoration: const BoxDecoration(
                                color: WeinFluColors.brandSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(WeinFluRadius.small)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/google.png'),
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  WeinfluCopys.google,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: WeinFluColors.brandLigthDarkColor),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 69,
                            decoration: const BoxDecoration(
                                color: WeinFluColors.brandSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(WeinFluRadius.small)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/facebook.png'),
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  WeinfluCopys.facebook,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: WeinFluColors.brandLigthDarkColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(WeinfluCopys.notAMember),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                WeinfluCopys.registerNow,
                                style: TextStyle(
                                    color: WeinFluColors.brandPrimaryColor,
                                    fontSize: 13),
                              ))
                        ],
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
