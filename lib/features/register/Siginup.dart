import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:telaproject/core/database/sql.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/custom_btn.dart';
import '../../core/widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isInsertedTrue = false;
  var userType = getIt<CacheHelper>().getData(key: "userType");

  Sql sql = Sql();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    return sha256.convert(bytes).toString(); // Hash and convert to hex
  }

  readUserId() async {
    var response = await sql.readUserId(firstName.text, lastName.text);
    if (response == true) {
      print(sql.userIdInserted);
    } else {
      return 0;
    }
  }

  readToInsert() async {
    var response = await sql.readUserId(firstName.text, lastName.text);
    if (response == true) {
      setState(() {
        isInsertedTrue = true;
      });
    } else {
      customNavigate(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      backgroundColor: AppColor.white3,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: ListView(
          children: [
            Center(child: titleOfApp(29.0)),
            Padding(
              padding: const EdgeInsets.only(bottom: 2, right: 63, left: 63),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(textHint: "First Name", nameField: firstName),
                    CustomTextField(textHint: "Last Name", nameField: lastName),
                    CustomTextField(textHint: "Password", field: true, nameField: password),
                    CustomTextField(
                      textHint: "Re Enter Password",
                      nameField: rePassword,
                      field: true,
                      pass1: password,
                      pass2: rePassword,
                    ),
                    CustomTextField(textHint: "Number", nameField: number),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 37, left: 99, right: 60, bottom: 101),
              child: CustomBtn(
                text: "Register",
                width: 279,
                height: 70,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    readToInsert();
                    if (isInsertedTrue == false) {
                      // Hash the password before storing it
                      final hashedPassword = hashPassword(password.text);

                      final result1 = sql.insertData(
                        'INSERT INTO UserInformation(first_name, last_name, Password, Number, type_user, score) '
                            'VALUES("${firstName.text}", "${lastName.text}", "$hashedPassword", "${number.text}", "$userType", "${0}")',
                      );

                      readUserId();
                      var result2 = sql.insertData(
                        'INSERT INTO Clothes(image_clothes, user_id) '
                            'VALUES("${(userType == "boy") ? "boy7.png" : "girl11.png"}", "${sql.userIdInserted}")',
                      );

                      if (result1 != null && result2 != null) {
                        print("Inserted data");
                      } else {
                        print("No data inserted");
                      }
                    }
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 154),
              child: Row(
                children: [
                  Text("Contact Us For More", style: CustomTextStyles.MerriweatherBlackstyle24),
                ],
              ),
            ),
            if (isInsertedTrue)
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 40),
                child: Text(
                  "The First Name and Last Name already exist",
                  style: CustomTextStyles.Merriweatherstyle15.copyWith(
                    color: AppColor.red,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
