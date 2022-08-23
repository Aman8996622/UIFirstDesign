import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import 'package:uifirstdesign/ui/view/book.dart';
import 'package:uifirstdesign/ui/view/comiclist.dart';
import 'package:uifirstdesign/ui/widget/button.dart';
import 'package:uifirstdesign/ui/widget/toast.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  File? _image;
  Future getGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  get form => FormGroup(
        {
          'name': FormControl<String>(
            value: '',
            validators: [
              Validators.required,
            ],
          ),
          'NickName': FormControl<String>(
            value: '',
            validators: [
              Validators.required
            ],
          ),
          'email': FormControl<String>(
            value: '',
            validators: [Validators.required, Validators.email],
          ),
          'password': FormControl<String>(
            value: '',
            validators: [Validators.required, Validators.minLength(8)],
          ),
          'ConfirmPassword': FormControl<String>(
            value: '',
            validators: [Validators.required, Validators.minLength(8)],
          ),
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 73,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0XFF9D9D9D),
                    backgroundImage: _image == null
                        ? const AssetImage("assets/Rectangle 10.png")
                        : AssetImage(
                            Image.file(_image!).toString(),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 70),
                    child: InkWell(
                      onTap: () {
                        getGallery();
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 67,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(39),
                child: ReactiveFormBuilder(
                  form: () => form,
                  builder: (context, formGroup, child) {
                    return Column(
                      children: [
                        ReactiveTextField(
                          formControlName: 'name',
                          decoration: const InputDecoration(
                            hintText: "Enter Your name",
                          ),
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Field must not be empty',
                          },
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        ReactiveTextField(
                          formControlName: 'NickName',
                          decoration: const InputDecoration(
                            hintText: "Enter Your NickName",
                          ),
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Field must not be empty',
                          },
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        ReactiveTextField(
                          formControlName: 'password',
                          decoration: const InputDecoration(
                            hintText: "Enter Your password",
                          ),
                          validationMessages: {
                            'requried': (error) => 'password cannot be empty',
                            ValidationMessage.minLength: (error) =>
                                'The password must be at least ${(error as Map)['requiredLength']} characters long'
                          },
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        ReactiveTextField(
                          formControlName: 'ConfirmPassword',
                          decoration: const InputDecoration(
                            hintText: "Confirm Your Passwerd",
                          ),
                          validationMessages: {
                            'requried': (error) => 'password cannot be empty',
                            ValidationMessage.minLength: (error) =>
                                'The password must be at least ${(error as Map)['requiredLength']} characters long'
                          },
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                       ReactiveFormConsumer(
                          builder: (cxt, form, child) {
                            return Butt(
                              text: 'Continue',
                              colorBg: const Color(0Xff9D9D9D),
                              colorText: Colors.white,
                              ontap: () {
                                form.valid
                                    ? buildSubmit(context)
                                    : BottomToast()
                                        .showToast("Fill all required fields");
                              },
                              padding: const EdgeInsets.symmetric(
                                horizontal: 100.0,
                                vertical: 17.0,
                              ),
                            );
                          },
                        ),
                        
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  buildSubmit(BuildContext context) {
    BottomToast().showToast("Submit Sucessfully");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Comiclist(),
      )
     
    );
  }
}
