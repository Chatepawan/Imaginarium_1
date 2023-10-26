import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imaginarium/src/constants/colors.dart';
import 'package:imaginarium/src/features/authentication/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();

}

class _SignUpState extends State<SignUp> {
  String? selectedGender;
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: whiteColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text( "Let's find your balance",
                              style: GoogleFonts.spaceGrotesk(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                'Register Now',
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                    fontStyle: FontStyle.italic
                                ),),
                            )
                          ],
                        ),

                        //text for register now
                        // Container(
                        //   margin: const EdgeInsets.only(top: 10),
                        //   child: const Text(
                        //     "Register now",
                        //     style: GoogleFonts.spaceGrotesk(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        // width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Image.asset("assets/images/signup_screen.png"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  // height: double.maxFinite,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.black,
                    //   width: 1,
                    // ),
                    //borderradius only for top
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text create your account
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: const EdgeInsets.only(top: 19),
                          child: Text(
                            "Create your account",
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //Textfield for Name
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Enter your Name',
                            labelStyle: GoogleFonts.spaceGrotesk(
                              color: whiteColor,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: whiteColor,
                              ),
                            ),
                          ),

                        ),
                      ),
                      //Textfield for Email
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: 'Enter your Email Address',
                              labelStyle: GoogleFonts.spaceGrotesk(
                                color: whiteColor,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            style: GoogleFonts.spaceGrotesk(
                              color: whiteColor,
                            )

                        ),
                      ),
                      //Textfield for Password
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your Password',
                            labelStyle: GoogleFonts.spaceGrotesk(
                              color: whiteColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Textfield for Confirm Password
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your Password to Confirm',
                            labelStyle: GoogleFonts.spaceGrotesk(
                              color: whiteColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //dropdown for Country
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              child: DropdownButtonFormField<String>(
                                dropdownColor: primaryColor,
                                decoration: InputDecoration(
                                  labelText: "Gender",
                                  labelStyle: GoogleFonts.spaceGrotesk(
                                    color: whiteColor,
                                  ),
                                  contentPadding: EdgeInsets.all(16.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: whiteColor,
                                    ),

                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: whiteColor),
                                  ),
                                ),
                                style: GoogleFonts.spaceGrotesk(
                                  color: whiteColor,
                                ),
                                value: selectedGender, // You can set an initial value if needed
                                onChanged: (newValue) {
                                  // Update the selectedGender variable when a new value is selected
                                  setState(() {
                                    selectedGender = newValue!;
                                  });
                                },
                                items: [
                                  "Male",
                                  "Female",
                                  "Other",
                                ]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              child: TextField(
                                keyboardType: TextInputType.number, // Allow only numbers
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, // Restrict input to digits (numbers)
                                ],
                                decoration: InputDecoration(
                                  labelText: "Age",
                                  labelStyle: GoogleFonts.spaceGrotesk(
                                    color: whiteColor,
                                  ),
                                  hintText: "Enter your Age",
                                  contentPadding: EdgeInsets.all(16.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: whiteColor),
                                  ),

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked, // A boolean variable to manage the checkbox state
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                            ),
                            Flexible(
                              child: Text(
                                "I agree with the terms and conditions by creating an account",
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, right: 15),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Already have an account?",
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Button for Create an Account
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: TextButton(onPressed: (){},
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow( blurRadius: 2, color: Colors.black12, spreadRadius: 0, offset: Offset(-5, 5))
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.spaceGrotesk(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Text for Already have an account

                      //Button for Login
                      Container(
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Expanded(child: Divider(color: Colors.white,)
                                ),
                                Text(" Or continue with with Google ", style: GoogleFonts.spaceGrotesk(),),
                                const Expanded(child: Divider(color: Colors.white,))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/google.png'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Sign up with Google",
                                            style: GoogleFonts.spaceGrotesk(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700, color: primaryColor,
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
