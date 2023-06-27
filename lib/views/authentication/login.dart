import 'package:book_store/themes/theme.dart';
import 'package:book_store/utils/widgets.dart';
import 'package:book_store/views/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController uNameOrEmail = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration:
            const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset("assets/images/app_logo.png"),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome to WINS. Please enter your email address and password.",
                      style: CustomTheme
                          .lightTheme()
                          .textTheme
                          .labelMedium,
                      softWrap: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Sign in to your account",
                      style: CustomTheme
                          .lightTheme()
                          .textTheme
                          .labelSmall,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomWidgets().authTextField(
                        label: "USER NAME / EMAIL",
                        textFieldColor: CustomColor.authenticationTextFieldColor,
                        verticalPadding: 15,
                        controller: uNameOrEmail,
                        keyboard: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) => value == '' ? 'Please enter User Name or Email' : null),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomWidgets().authTextField(
                        label: "PASSWORD",
                        textFieldColor: CustomColor.authenticationTextFieldColor,
                        verticalPadding: 15,
                        controller: pass,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Please enter minimum 8 digit password';
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: CustomColor.authenticationTextFieldColor.withOpacity(0.6),
                            size: 25,
                          ),
                        ),
                        obscureText: hidePassword),
                    const SizedBox(height: 40,),

                    GestureDetector(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Homepage(),));
                        }
                      },
                      child: Container(width: double.infinity,
                        height: 58,
                        decoration: BoxDecoration(
                            color: CustomColor.authenticationTextFieldColor, borderRadius: BorderRadius.circular(90)),
                        child: Center(child: Text("Sign In", style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(color: Colors.black),),),),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
