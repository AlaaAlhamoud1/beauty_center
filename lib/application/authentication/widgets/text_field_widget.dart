// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beauty_center/core/values/values.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
                color: AppColors.darkGreyColor, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 8))
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                border: const OutlineInputBorder(borderSide: BorderSide()),
              ),
              style: TextStyle(color: AppColors.greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
