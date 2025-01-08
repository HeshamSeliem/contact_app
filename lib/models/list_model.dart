import 'dart:io';

import 'package:contact_app/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class ItemModel {
  String name;
  String email;
  String phone;
  final File? image;
 // String image;
  ItemModel({required this.name , required this.email , required this.phone,required this.image });
}
