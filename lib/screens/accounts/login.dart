import 'package:admin_dashboard/screens/accounts/login_data.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/provider/loading_provider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:admin_dashboard/shared/components/progress.dart';
import 'package:admin_dashboard/shared/widgets/account_widgets/account_buttons.dart';
import 'package:admin_dashboard/shared/widgets/account_widgets/default_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  bool showPassword = true;
  bool isLoading = false;
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _globalKey,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 5.0),
                        margin: const EdgeInsets.only(bottom: 25.0),
                        child:const Text(
                          'Log in to your account',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      DefaultFormField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureValue: false,
                        maxLineNumber: 1,
                        showPassword: false,
                        suffixIconFunction: (){},
                        inputType: TextInputType.emailAddress,
                        isPasswordTextField: false,
                        validatorFunction: (String? value) {
                          if (value!.isEmpty ||
                              !value.contains(".") ||
                              !value.contains("@")) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureValue: true,
                        isPasswordTextField: true,
                        maxLineNumber: 1,
                        showPassword: showPassword,
                        suffixIconFunction: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        inputType: TextInputType.text,
                        validatorFunction: (String? value) {
                          if ( value!.length < 4) {
                            return 'Please enter valid password more than 4 character';
                          }
                          return null;
                        },
                      ),
                    const  SizedBox(
                        height: 20.0,
                      ),
                      Consumer<LoadingControl>(builder: (context, load, child) {
                        return isLoading
                            ? circularProgress()
                            : AccountsButton(
                                buttonText: 'Log in',
                                onPressButton: () async {
                                  // login and go to home screen
                                  if (!await checkConnection()) {
                                    Toast.show(
                                        "Please check your internet connection.",
                                        duration: Toast.lengthLong,
                                        gravity: Toast.bottom);
                                  } else if (_globalKey.currentState!
                                      .validate()) {
                                    isLoading = true;
                                    load.addLoading();
                                    bool res = await loginUsers(
                                        emailController.text,
                                        passwordController.text,
                                        context);
                                    if (res == false) {
                                      Toast.show(
                                        "Please enter valid Email or password",
                                          duration: Toast.lengthLong,
                                          gravity: Toast.bottom);
                                    }
                                    isLoading = res;
                                    load.addLoading();
                                    print('login Data ------------->');
                                    print(
                                        'User Email is: ${emailController.text}');
                                    print(
                                        'User pass is: ${passwordController.text}');
                                  }
                                },
                              );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
