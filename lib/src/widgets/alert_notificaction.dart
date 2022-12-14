import 'package:flutter/material.dart';

void AlertNotification(BuildContext context, String title, String textBody) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (constext) {
        return AlertDialog(
          elevation: 5,
          title: Text(title),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(textBody),
              SizedBox(height: 10),
              Icon(Icons.thumb_up)
            ],
          ),

          /*
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ok'))
          ],

           */
        );
      });
}