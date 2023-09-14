import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibify/modals/colors.dart';
import 'package:vibify/ui/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool passwordvisible=true;
  var emailcontroller = TextEditingController();
  var pwdcontroller=TextEditingController();
  bool emailvalid=false;

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol=myColors();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/WelcomeScreenbg.png"),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.height*0.15,
                left: 30,
                child: SizedBox(
                  width: size.width*0.8,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SIGN IN",style: GoogleFonts.questrial(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 40,),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("E-Mail",style: GoogleFonts.questrial(color: Colors.white),),
                          icon: const Icon(Icons.email_outlined,color: Colors.white,),
                          suffixIcon: emailvalid?const Icon(Icons.check_circle,color: Colors.green,):const SizedBox()

                        ),
                        onChanged: (text){
                          setState(() {
                            emailvalid=EmailValidator.validate(emailcontroller.text);
                          });
                        },
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                        controller: emailcontroller,

                      ),
                      const SizedBox(height: 30,),
                      TextField(
                        controller: pwdcontroller,
                        decoration: InputDecoration(
                          label: Text("Password",style: GoogleFonts.questrial(color: Colors.white)),
                          icon: const Icon(Icons.lock_outline,color: Colors.white,),
                          suffixIcon: IconButton(
                            icon: Icon(passwordvisible?Icons.visibility_outlined:Icons.visibility_off_outlined,color: Colors.white,),
                            onPressed: (){
                              setState(() {
                                passwordvisible=!passwordvisible;
                              });

                            },
                          )
                        ),
                        obscureText: passwordvisible,
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                      ),
                      const SizedBox(height: 30,),
                      Row(mainAxisAlignment: MainAxisAlignment.end,children: [TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordPage()));
                      },
                      child: Text("Forgot Password?",style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),))],),
                      const SizedBox(height: 30,),
                      SizedBox(width:size.width*0.8,child: Center(child:
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreenPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mcol.neonblue,
                          minimumSize: Size(size.width*0.5,50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                        ),

                        child: Text("SIGN IN",style: GoogleFonts.questrial(fontSize: 30,color: mcol.darkblue),),))),
                      SizedBox(height: size.height*0.075,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(color: Colors.grey,width: size.width*0.2,height: 2),
                          Text("or connect with",style: GoogleFonts.questrial(fontSize: 23,color: Colors.grey),),
                          Container(color: Colors.grey,width: size.width*0.2,height: 2),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff3b5998),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            minimumSize: const Size(70, 70)
                          ), child: Text("f",style: GoogleFonts.poppins(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold)),),
                          const SizedBox(width: 30,),
                          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffdc4e41),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40))
                              ),
                              minimumSize: const Size(70, 70)
                          ), child: Text("G",style: GoogleFonts.poppins(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold)),),
                        ],
                      ),
                      SizedBox(height: size.height*0.1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account?",style: GoogleFonts.questrial(color: Colors.white,fontSize: 20),),
                          TextButton(onPressed: () {
                            setState(() {
                              emailcontroller.clear();
                              pwdcontroller.clear();
                              emailvalid=false;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                          },
                          child: Text("Sign-up",style: GoogleFonts.questrial(color: mcol.neonblue,fontSize: 20),))
                        ],
                      )
                    ],

            ),
                ))
            
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var namecontroller = TextEditingController();
  var emailcontroller= TextEditingController();
  var pwdcontroller = TextEditingController();
  bool emailvalid=false;
  bool passwordvisible=true;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol=myColors();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/WelcomeScreenbg.png"),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: size.height*0.075,
                left:10,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);

                },icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,),)),
            Positioned(
                top: size.height*0.15,
                left: 30,
                child: SizedBox(
                  width: size.width*0.8,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SIGN UP",style: GoogleFonts.questrial(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 40,),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("Name",style: GoogleFonts.questrial(color: Colors.white),),
                          icon: const Icon(Icons.person_2_outlined,color: Colors.white,),

                        ),
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                        controller: namecontroller,

                      ),
                      const SizedBox(height: 30,),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("E-Mail",style: GoogleFonts.questrial(color: Colors.white),),
                          icon: const Icon(Icons.email_outlined,color: Colors.white,),
                          suffixIcon: emailvalid?const Icon(Icons.check_circle,color: Colors.green,):const SizedBox(),
                        ),
                        onChanged: (text){
                          setState(() {
                            emailvalid= EmailValidator.validate(text);
                          });
                        },
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                        controller: emailcontroller,

                      ),
                      const SizedBox(height: 30,),
                      TextField(
                        controller: pwdcontroller,
                        decoration: InputDecoration(
                            label: Text("Password",style: GoogleFonts.questrial(color: Colors.white)),
                            icon: const Icon(Icons.lock_outline,color: Colors.white,),
                            suffixIcon: IconButton(
                              icon: Icon(passwordvisible?Icons.visibility_outlined:Icons.visibility_off_outlined,color: Colors.white,),
                              onPressed: (){
                                setState(() {
                                  passwordvisible=!passwordvisible;
                                });

                              },
                            )
                        ),
                        obscureText: passwordvisible,
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                      ),
                      const SizedBox(height: 100,),
                      SizedBox(width:size.width*0.8,child: Center(child:
                      ElevatedButton(
                        onPressed: (){
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mcol.neonblue,
                            minimumSize: Size(size.width*0.5,50),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                        ),

                        child: Text("SIGN UP",style: GoogleFonts.questrial(fontSize: 30,color: mcol.darkblue),),))),

                  ]),
                ))

          ],
        ),
      ),
    );
  }
}
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var emailcontroller= TextEditingController();
  bool emailvalid=false;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol=myColors();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/WelcomeScreenbg.png"),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: size.height*0.075,
              left:10,
              child: IconButton(onPressed: (){
                Navigator.pop(context);

              },icon: const Icon(Icons.arrow_back,color: Colors.white,size: 40,),)),
          Positioned(
              top: size.height*0.15,
              left: 30,
              child: SizedBox(
                width: size.width*0.8,
                height: size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Forgot Password?",style: GoogleFonts.questrial(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      Text("If you need help resetting your password,\nwe can help by sending you a link to\nreset it",style: GoogleFonts.questrial(color: Colors.grey,fontSize: 18),),
                      const SizedBox(height: 40,),
                      TextField(
                        decoration: InputDecoration(
                          label: Text("E-Mail",style: GoogleFonts.questrial(color: Colors.white),),
                          icon: const Icon(Icons.email_outlined,color: Colors.white,),
                          suffixIcon: emailvalid?const Icon(Icons.check_circle,color: Colors.green,):const SizedBox(),
                        ),
                        onChanged: (text){
                          setState(() {
                            emailvalid= EmailValidator.validate(text);
                          });
                        },
                        style: GoogleFonts.questrial(color: Colors.white,fontSize: 24),
                        controller: emailcontroller,

                      ),
                      SizedBox(height: size.height*0.1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mcol.neonblue,
                                minimumSize: Size(size.width*0.5,50),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                )
                            ),

                            child: Text("SEND",style: GoogleFonts.questrial(fontSize: 30,color: mcol.darkblue),),),
                        ],
                      ),

                    ]),
              ))

        ],
      ),
    ),

    );
  }
}

