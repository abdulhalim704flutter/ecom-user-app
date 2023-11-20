import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

showSingleTextInputDailog({
  required BuildContext context,
  required String title,
  String posButton = 'Save',
  String nagButton = 'Cancel',
  required Function(String) onSave,
}) {
  final controller = TextEditingController();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                autofocus: true,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(nagButton)),
              TextButton(
                  onPressed: () {
                    if (controller.text.isEmpty) return;
                    Navigator.pop(context);
                    onSave(controller.text);
                  },
                  child: Text(posButton)),
            ],
          ));
}
