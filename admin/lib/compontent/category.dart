import 'package:flutter/material.dart';

class category extends StatelessWidget {
  final String? image;
  final String? text;
  final double? fontSize;
  final Function()? ontap;
  final Color? colorcontainer;
  final Color? border1;

  category({
    this.image,
    this.text,
    this.fontSize,
    this.ontap,
    this.colorcontainer,
    this.border1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: 150,
          height: 190,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colorcontainer,
            border: Border.all(
              color: border1!,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Image.asset(image!),
              ),
              SizedBox(height: 17),
              Text(
                text!,
                style: TextStyle(
                  fontFamily: 'Gabriela',
                  fontSize: fontSize,
                  color: border1,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
