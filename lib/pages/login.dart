import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/bloc/login_bloc.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/demis.dart';
import 'package:todo/constants/strings.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/register.dart';
import 'package:todo/widgets/background_container.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/developed_by_recoding.dart';
import 'package:todo/widgets/easy_text.dart';
import 'package:todo/widgets/easy_text_field.dart';
import 'package:todo/widgets/have_acc_or_non_acc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return ChangeNotifierProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ////Background Container with gradient Color
                const BackGroundContainer(),

                Column(
                  children: [
                    const SizedBox(height: kSP100x),

                    ////Appication Title
                    const EasyText(
                      text: kTodo,
                      textColor: kWhite,
                      fontSize: kFontSize28x,
                      fontWeight: FontWeight.w900,
                    ),

                    const SizedBox(height: kSP50x),

                    ////Login Container Box
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(horizontal: kSP20x),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSP20x, vertical: kSP50x),
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(kSP10x),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 0.7,
                                blurRadius: 5,
                                color: kShadowColor)
                          ]),
                      child: Column(
                        children: [
                          ////Login
                          const EasyText(
                            text: kLogin,
                            textColor: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: kFontSize24x,
                          ),

                          const SizedBox(height: kSP50x),

                          ////Form
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  ////Username TextFromField
                                  EasyTextField(
                                      controller: _usernameController,
                                      lableText: kUsername,
                                      validate: (value) {
                                        var temp = value ?? '';
                                        if (temp.isEmpty || temp == '') {
                                          return kUsernameErrorText;
                                        }
                                        return null;
                                      }),

                                  const SizedBox(height: kSP20x),

                                  ////Password TextFromField
                                  EasyTextField(
                                      controller: _passwordController,
                                      lableText: kPassword,
                                      isObscure: true,
                                      validate: (value) {
                                        var temp = value ?? '';
                                        if (temp.isEmpty || temp == '') {
                                          return kPasswordErrorText;
                                        }
                                        return null;
                                      }),

                                  const SizedBox(height: kSP20x),

                                  ////Login button
                                  CustomButton(
                                      text: kLogin,
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                           Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(),
                                            ));
                                        }
                                      }),
                                  const SizedBox(height: kSP20x),

                                  ///Don't have an Account? Register Text
                                  HaveAccOrNonAcc(
                                      haveOrNotAcc: kDontAcc,
                                      registerOrLogin: kRegister,
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register(),
                                            ));
                                      })
                                ],
                              ))
                        ],
                      ),
                    ),

                    const SizedBox(height: kSP100x),

                    ////Dev
                    const DevelopedByReCoding()
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
