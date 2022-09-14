import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_event.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  DateTime? birthdate;
  final formKey = GlobalKey<FormState>();

  TextEditingController birthdatePicker = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();

  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "Erbil", child: Text("هەولێر")),
    DropdownMenuItem(value: "Sulaymaniyah", child: Text("سلێمانی")),
    DropdownMenuItem(value: "Karkuk", child: Text("کەرکوک")),
    DropdownMenuItem(value: "Duhok", child: Text("دهۆک")),
  ];

  String? selectedDropValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Form(
            key: formKey,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: fnameController,
                        decoration: const InputDecoration(
                          labelText: "First Name",
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Field must not be empty";
                          } else if (value.contains(" ")) {
                            return "Remove spaces";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: lnameController,
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Field must not be empty";
                          } else if (value.contains(" ")) {
                            return "Remove spaces";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: birthdatePicker,
                        decoration: const InputDecoration(
                          labelText: "Birthdate",
                          suffixIcon: Icon(CupertinoIcons.calendar),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? d = await DatePicker.showSimpleDatePicker(
                            context,
                            titleText: " Date of Birth",
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960),
                            lastDate: DateTime.now(),
                            dateFormat: "dd-MMMM-yyyy",
                            looping: true,
                            locale: DateTimePickerLocale.en_us,
                          );
                          if (d != null) {
                            birthdate = d;
                            debugPrint(birthdate!.toIso8601String());
                            setState(() {
                              birthdatePicker.text =
                                  birthdate!.toIso8601String().split("T")[0];
                            });
                          }
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Field must not be empty";
                          } else if (value.contains(" ")) {
                            return "Remove spaces";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonTheme(
                          hoverColor: Colors.transparent,
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                                value: selectedDropValue,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(15),
                                decoration: const InputDecoration(
                                  labelText: "City",
                                ),
                                items: menuItems,
                                validator: (value) {
                                  if (value == null) {
                                    return "City";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    selectedDropValue = value;
                                  });
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            child: const Text("Continue"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .set({
                                  "fname": fnameController.value.text,
                                  "lname": lnameController.value.text,
                                  "dob": birthdate,
                                  "address": selectedDropValue,
                                  "email":
                                      FirebaseAuth.instance.currentUser!.email,
                                }).onError((error, stackTrace) =>
                                        debugPrint("error occured $error"));

                                context.read<UserBloc>().add(InitializeUser());
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
