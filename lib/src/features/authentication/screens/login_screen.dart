import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imaginarium/src/constants/colors.dart';
import 'package:imaginarium/src/features/authentication/screens/forgot_password_screen.dart';
import 'package:imaginarium/src/features/authentication/screens/signup_screen.dart';

import '../../../../bottom_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
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
                            Text( "Login",
                              style: GoogleFonts.spaceGrotesk(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                'Welcome Back',
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        // width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Image.asset("assets/images/login_screen.png"),
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Login to Your Account",
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            const SizedBox(height: 6,),
                            Text(
                              "Make sure that you already have an account.",
                              style: GoogleFonts.spaceGrotesk(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      //Textfield for Email
                      Container(
                        margin: const EdgeInsets.only(top: 0, left: 20, right: 20),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10, top: 15),
                        child: Row(
                          children: [
                            Flexible(
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
                                  Text(
                                    "Remember Me",
                                    style: GoogleFonts.spaceGrotesk(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  // onTap: (){AlertDialog()},
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FgPass()),);
                                    },
                                    child: Text("Forgot Password?",
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 12,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),


                      //Button for Create an Account
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
                          child: TextButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                          },
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
                                  "Login",
                                  style: GoogleFonts.spaceGrotesk(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Text for Don't have an account
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, right: 15),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Don't have an account?",
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Button for Login
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
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
