import 'dart:io';

import 'package:contact_app/models/list_model.dart';
import 'package:contact_app/screens/users_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});
  static const String routeName = "log_in";

  /// we will hold the text field value with controller.value.text
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  List<ItemModel> modelList = [];

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  File? image;
  File? _image; // To store the selected image
  final ImagePicker _picker = ImagePicker(); // to select the package
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Store the selected image
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 29, 48),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 550,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Color(0xff29384D),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        width: 140,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: const Color(0xffFFF1D4)),
                        ),
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.file(
                                  _image!,
                                  width: 140,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Lottie.asset(
                                "assets/animations/image_picker.json",
                                width: 140,
                                height: 150,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (_namecontroller.value.text.isEmpty)
                            ? const Text(
                                "User Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFF1D4)),
                              )
                            : Text(
                                _namecontroller.value.text,
                                style: const TextStyle(
                                    color: Color(0xffFFF1D4), fontSize: 16),
                              ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: SizedBox(
                            width: 150,
                            child: Divider(
                              thickness: 2,
                              color: Color(0xffFFF1D4),
                            ),
                          ),
                        ),
                        (_emailcontroller.value.text.isEmpty)
                            ? const Text(
                                "example@email.com",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFF1D4)),
                              )
                            : Text(
                                _emailcontroller.value.text,
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xffFFF1D4)),
                              ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8),
                          child: SizedBox(
                            width: 150,
                            child: Divider(
                              thickness: 2,
                              color: Color(0xffFFF1D4),
                            ),
                          ),
                        ),
                        (_phonecontroller.value.text.isEmpty)
                            ? const Text(
                                "+200000000000",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFF1D4)),
                              )
                            : Text(
                                _phonecontroller.value.text,
                                style: const TextStyle(
                                    fontSize: 14, color: Color(0xffFFF1D4)),
                              )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
               TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _namecontroller,
                  onChanged: (value) {
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
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: _emailcontroller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter user email",
                      hintStyle: TextStyle(color: Color(0xffE2F4F6)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                     borderSide: BorderSide(color: Color(0xffFFF1D4)
                     )
                     ),
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                     borderSide: BorderSide(color: Color(0xffFFF1D4)
                     )
                     ),
                       focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                     borderSide: BorderSide(color: Color(0xffFFF1D4)
                     )
                     ),
                     ),
                     
                  style: const TextStyle(
                    color: Color(0xffE2F4F6),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Please enter your phone";
                    }
                    else
                    {
                      return null;
                    }

                  },
                  controller: _phonecontroller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter user phone",
                      hintStyle: TextStyle(color: Color(0xffE2F4F6)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide(color: Color(0xffFFF1D4))),
                           focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                     borderSide: BorderSide(color: Color(0xffFFF1D4)
                     )
                     ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                     borderSide: BorderSide(color: Color(0xffFFF1D4)
                     )
                     ),
                          ),
                  style: const TextStyle(
                    color: Color(0xffE2F4F6),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xffFFF1D4),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xffFFF1D4))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserList(
                                itemModel_p: ItemModel(
                                  name: _namecontroller.text,
                                  email: _emailcontroller.text,
                                  phone: _phonecontroller.text,
                                 image: _image,
                                ),
                                itemModelList: modelList,
                              ),
                            ),
                          );
                          modelList.add(ItemModel(
                            name: _namecontroller.text,
                            email: _emailcontroller.text,
                            phone: _phonecontroller.text,
                            image: _image,
                          ));
                        }
                      },
                      child: const Text("Enter user")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
