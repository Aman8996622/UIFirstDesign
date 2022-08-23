import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uifirstdesign/ui/styledata/themeColor.dart';
import 'package:uifirstdesign/ui/view/category.dart';
import 'package:uifirstdesign/ui/view/login.dart';
import 'package:uifirstdesign/ui/widget/button.dart';
import 'package:uifirstdesign/ui/widget/toast.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  final form = FormGroup(
    {
      'email': FormControl<String>(
          value: '', validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'New password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildScreen(),
    );
  }

  Widget buildScreen() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              top: 100.0,
            ),
            child: Text("Welcome",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(fontSize: 36, color: Colors.black)),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in  to start",
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              fontSize: 14,
              color: const Color(0xFF9D9D9D),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Butt(
            ontap: () {},
            image: "assets/google.png",
            text: "Continue with google",
          ),
          const SizedBox(
            height: 40.0,
          ),
          Butt(
            ontap: () {},
            image: "assets/meta.png",
            text: "Continue with meta",
            colorText: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 42.0,
              vertical: 8.0,
            ),
            colorBg: const Color(0XFF2079FF),
          ),
          const SizedBox(
            height: 40,
          ),
          buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500.0,
      decoration:  ShapeDecoration(
        gradient: LinearGradient(
            begin: const Alignment(0.2, 0.5),
            end: Alignment.topLeft,
            colors:ThemeColor.gcolor,
            ),
        shape: const  RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        )),
      ),
      padding: const EdgeInsets.only(
        left: 47,
        right: 48,
        top: 62,
      ),
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReactiveTextField(
                formControlName: 'email',
                decoration: const InputDecoration(
                  hintText: "Login Id",
                ),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Field must not be empty',
                  ValidationMessage.email: (error) =>
                      'Must enter a valid email',
                },
              ),
              const SizedBox(height: 40),
              ReactiveTextField(
                formControlName: 'password',
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validationMessages: {
                  'Requried': (error) => 'password cannot be empty',
                  ValidationMessage.minLength: (error) =>
                      'The password must be at least ${(error as Map)['requiredLength']} characters long'
                },
              ),
              const SizedBox(height: 40),
              ReactiveTextField(
                formControlName: 'New password',
                decoration: const InputDecoration(
                  hintText: "New Password",
                ),
                validationMessages: {
                  'Requried': (error) => 'password cannot be empty',
                  ValidationMessage.minLength: (error) =>
                      'The password must be at least ${(error as Map)['requiredLength']} characters long'
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haven't account?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, color: const Color(0xff424242)),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    child: RichText(
                      text: TextSpan(
                        text: "Sign up !",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16, color: const Color(0xff2079FF)),
                      ),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      ),
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return Butt(
                    text: 'Continue',
                    colorBg: const Color(0Xff9D9D9D),
                    colorText: Colors.white,
                    ontap: () {
                      form.valid
                          ? buildSubmit(context)
                          : BottomToast().showToast("Fill all required fields");
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
    );
  }

  buildSubmit(BuildContext context) {
    BottomToast().showToast("Submit Sucessfully");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Comic(),
      ),
    );
  }
}
