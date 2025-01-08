import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({required this.errorMessage,required this.hinttext,required this.onChanged, super.key});
   
   String errorMessage;
   String hinttext;
   Function onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return widget.errorMessage;
                    }
                    return null;
                  },
                  controller: nameController,
                  onChanged: (value) {
                    nameController.text = value;
                    setState(() {}); // Notify the framework to rebuild the UI
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter user name",
                    hintStyle:  TextStyle(color: Color(0xffE2F4F6)),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Color(0xffFFF1D4)),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Color(0xffFFF1D4)),
                    ),
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Color(0xffFFF1D4)),
                    ),
                    disabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Color(0xffFFF1D4)),
                    ),
                    errorBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xffE2F4F6),
                  ),
                );
  }
}