import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant.dart';
import '../../widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tiktok Clone',
                style: TextStyle(
                    fontSize: 35,
                    color: buttonColor,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: buttonColor,
                    child: Icon(
                      Iconsax.user_add,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () => authController.pickImage(),
                        child: Icon(
                          Iconsax.camera,
                          color: buttonColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text('Register', style: TextStyle(fontSize: 25)),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _userNameController,
                    labeltext: 'UserName',
                    icon: Icons.person),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    labeltext: 'Email',
                    icon: Icons.email),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _passwordController,
                    labeltext: 'password',
                    isobscure: true,
                    icon: Icons.lock),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () => authController.registerUser(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    _userNameController.text.trim(),
                    authController.Profilepick),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                child: const Text('Signup',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('login'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
