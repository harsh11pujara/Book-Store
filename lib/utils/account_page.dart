import 'package:book_store/themes/theme.dart';
import 'package:flutter/material.dart';

Widget accountPage(){
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController pass = TextEditingController();

  name.text = "Tom Hardy";
  email.text = "abc@gmail.com";
  contact.text = '9876543210';
  pass.text = 'Test@12345678';

  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
    child: Column(
      children: [
        TextField(controller: name,decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 20)),),
        TextField(controller: email,decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 20)),),
        TextField(controller: contact,decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 20)),),
        TextField(controller: pass,obscureText: true,decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 20)),),
        Expanded(child: Container(),),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            decoration: BoxDecoration(
              color: const Color(0xFF578DCD),
                borderRadius: BorderRadius.circular(90), border: Border.all(color: const Color(0xFF578DCD))),
            child: Text("Log Out",style: CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(fontSize: 17,color: Colors.white),),
          ),
        ),
        const SizedBox(height: 40,)
      ],
    ),
  );
}