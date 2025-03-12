import 'package:flutter/material.dart';
import 'package:g_alert/g_alert.dart';
import 'package:tiktok/constant.dart';

class AddVideoScreen extends StatelessWidget {
  AddVideoScreen({super.key});

  void _showAlert(BuildContext context) {
    Alert.show(
      context: context,
      title: 'Success',
      message: 'Your action was successful!',
      alertType: AlertType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            _showAlert(context);
          },
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
