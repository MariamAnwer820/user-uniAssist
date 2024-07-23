import 'package:flutter/material.dart';

// ignore: must_be_immutable
class categorylevel extends StatelessWidget {
  categorylevel({
    this.text,
    this.hinttext,
    this.colorcon,
    this.controller, required String? Function(dynamic value) validator,
  });
  String? text;
  String? hinttext;
  Color? colorcon;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(text!,
                style: TextStyle(
                  fontFamily: 'Gabriela',
                  fontSize: 20,
                  color: Color(0xFF47AD95),
                )),
          ],
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 1.5),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            labelText: hinttext,
            labelStyle: const TextStyle(
              color: Color(0xFFB7B7B7),
              fontSize: 30,
              fontFamily: 'Gabriela',
            ),
          ),
           validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
        ),
      ],
    );
  }
}
