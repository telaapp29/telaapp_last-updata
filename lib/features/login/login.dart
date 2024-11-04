import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/database/sql.dart';
import 'package:telaproject/core/services/service_locator.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/utils/app_text_style.dart';
import '../../core/widgets/backgrond.dart';
import '../../core/widgets/custom_btn.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/have_acount.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? check = false;
  bool isLoginTrue = false;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController minutesCount = TextEditingController();
  Sql sql = Sql();

  login() async {
    var response = await sql.login(
      userName.text,
      password.text,
    );
    if (response == true) {
      getIt<CacheHelper>().saveData(key: "login", value: sql.userId);
      getIt<CacheHelper>().saveData(key: "loginTypeUser", value: sql.userType);
      // getIt<CacheHelper>().saveData(key: "scoreUser", value: sql.score);
        GoRouter.of(context).push('/Clothes', extra: sql.userType);

    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Background(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 49, vertical: 60),
              child: ListView(
                children: [
                  Center(child: titleOfApp(54.0)),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 2, right: 63, left: 63),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            textHint: "User Name",
                            nameField: userName,
                          ),
                          CustomTextField(
                            textHint: "Password",
                            field: true,
                            nameField: password,
                          ),
                          CustomTextField(
                            textHint: "Time of minutes",
                            nameField: minutesCount,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 53, left: 99, bottom: 43, right: 60),
                    child: CustomBtn(
                      text: "Log in",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          int seconds = int.parse(minutesCount.text) * 60;
                          print(seconds);
                          getIt<CacheHelper>()
                              .saveData(key: "second", value: seconds);
                          login();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 99,
                      bottom: 16,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: check,
                          onChanged: (bool? value) {
                            setState(() {
                              check = value;
                              print(check);
                            });
                          },
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Text(
                          "Remember Me?",
                          style: CustomTextStyles.Merriweatherstyle15.copyWith(
                              color: AppColor.dBlack),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 65, bottom: 107, right: 65),
                    child: HaveAnAccount(
                      text1: "Not yet registered? ",
                      text2: "Sign up ",
                      text3: "now",
                      onTap: () {
                        customNavigate(context, '/Personality');
                        // customNavigate(context,'/Signup');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 85, right: 75),
                    child: Text(
                      "Need help?",
                      style: CustomTextStyles.Merriweather100style90.copyWith(
                          fontSize: 15),
                    ),
                  ),
                  if (isLoginTrue)
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "The user name or password is not valid",
                          style: CustomTextStyles.Merriweatherstyle15.copyWith(
                              color: AppColor.red, fontSize: 14),
                        )),
                ],
              ),
            ),
          );
  }
}
