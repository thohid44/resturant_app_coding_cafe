import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooderlich/widgets/custom_text_filed.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

// This function using for picke image
  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageXFile;
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

// This code for get location
  Position? position;
  List<Position>? placeMarks;

  getCurrentLocation() async {
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    position = newPosition;
    //  placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    // Placemark pMark = placeMarks![0];
    position = (await placemarkFromCoordinates(
        position!.latitude, position!.longitude)) as Position?;
    Placemark pMark = placeMarks![0] as Placemark;

    String completeAddress =
        '${pMark.subThoroughfare}  ${pMark.thoroughfare} ${pMark.subLocality} ${pMark.locality},${pMark.subAdministrativeArea} ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    _locationController.text = completeAddress;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 10),
          InkWell(
            onTap: () => _getImage(),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage:
                  imageXFile == null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null
                  ? Icon(Icons.add_photo_alternate,
                      size: MediaQuery.of(context).size.width * 0.20)
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextField(
                  data: Icons.person,
                  controller: _nameController,
                  hinText: "Name",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: _emailController,
                  hinText: "Email",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.person,
                  controller: _passwordController,
                  hinText: "Password",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.lock_clock,
                  controller: _confirmPasswordController,
                  hinText: "Confirm Password",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.lock_clock,
                  controller: _phoneController,
                  hinText: "Phone",
                  isObscure: false,
                ),
                CustomTextField(
                  data: Icons.my_location,
                  controller: _locationController,
                  hinText: "Location",
                  isObscure: false,
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ElevatedButton.icon(
                    label: const Text(
                      "Get my Current Location ",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getCurrentLocation();
                    },
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
            onPressed: () => print("Clicked"),
          )
        ]),
      ),
    );
  }
}
