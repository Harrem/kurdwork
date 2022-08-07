import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:kurdwork/screens/homeScreen.dart';

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
                      const SizedBox(
                        width: double.infinity,
                        child: Text("ناوی یەکەم"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: fnameController,
                        decoration: InputDecoration(
                          hintText: "ناوی یەکەمت بنوسە",
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "تکایە بۆشایەکە پڕبکەوە";
                          } else if (value.contains(" ")) {
                            return "پێویستە بۆشای لە ناوەکەت نەبێ";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity,
                        child: Text("ناوی دووەم"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: lnameController,
                        decoration: InputDecoration(
                          hintText: "ناوی دووەمت بنوسە",
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "تکایە بۆشایەکە پڕبکەوە";
                          } else if (value.contains(" ")) {
                            return "پێویستە بۆشای لە ناوەکەت نەبێ";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity,
                        child: Text("بەرواری لەدایکبوون"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: birthdatePicker,
                        decoration: InputDecoration(
                          hintText: "بەرواری لەدایکبوون دیاری بکە",
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: const Icon(CupertinoIcons.calendar),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? d = await DatePicker.showSimpleDatePicker(
                            context,
                            titleText: "بەروار هەڵبژێرە",
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
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
                            return "تکایە بۆشایەکە پڕبکەوە";
                          } else if (value.contains(" ")) {
                            return "پێویستە بۆشای لە ناوەکەت نەبێ";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: double.infinity,
                        child: Text("شوێنی نیشتەجێبوون"),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonTheme(
                          hoverColor: Colors.transparent,
                          alignedDropdown: true,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                                value: selectedDropValue,
                                hint: const Text("شوێنی نیشتەجێبوون"),
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(15),
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hoverColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                ),
                                items: menuItems,
                                validator: (value) {
                                  if (value == null) {
                                    return "تکایە شوێنێک هەڵبژێرە";
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
                        MyWidgets.myElevatedButton(
                            text: "دواتر",
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomeScreen(),
                                  ),
                                );
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
