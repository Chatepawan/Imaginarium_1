import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imaginarium/src/features/authentication/screens/login_screen.dart';
import '../../../constants/colors.dart';

class FgPass extends StatefulWidget{
  const FgPass({Key? key}) : super(key: key);
  @override
  State<FgPass> createState() => _FgPassState();
}
  @override
class _FgPassState extends State<FgPass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          Text( "Forgot?",
                            style: GoogleFonts.spaceGrotesk(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: primaryColor
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text(
                              'your Password',
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

                          Image.asset("assets/images/fg_pass.png",
                            width: 170,
                            height: 151,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                  child: Container(
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
                        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Reset Your Password",
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                          ],
                        ),
                      ),
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
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
                          child: TextButton(onPressed: (){
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
                                  "Reset",
                                  style: GoogleFonts.spaceGrotesk(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }

}