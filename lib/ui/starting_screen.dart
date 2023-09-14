import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibify/modals/colors.dart';
import 'package:vibify/ui/signin_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol=myColors();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/WelcomeScreenbg.png"),
            fit: BoxFit.cover,
            opacity: 0.3
          )
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.height*0.25,
              left: size.width*0.275,
              child: Container(decoration:const BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(200)),boxShadow: [BoxShadow(color: Colors.cyan,blurRadius: 20,spreadRadius: 4)]),child: Image.asset("assets/icon-512.png",width: size.width*0.45,)),)
            ,

            Positioned(
              bottom: 0,
                child: Container(
                  width: size.width,
                  height: size.height*0.45,
                  decoration: BoxDecoration(
                    color: mcol.darkblue.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  ),
                )),
            Positioned(
                top: size.height*0.58,
                left: size.width*0.3,
                child: Container(
              width: size.width*0.4,
              height: 10,
              decoration: BoxDecoration(
                color: mcol.neonblue,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),)),
            Positioned(
              top: size.height*0.625,
              left: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WELCOME TO\nVIBIFY",style: GoogleFonts.questrial(color: mcol.neonblue,fontSize: 50,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  Text("Start Your Musical Journey\nExplore, Listen, Repeat",style: GoogleFonts.questrial(color: Colors.white,fontSize: 30),),
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: SizedBox(width: size.width-80,
                      child: Center(
                        child: ElevatedButton(style:ElevatedButton.styleFrom(
                          backgroundColor: mcol.darkblue.withOpacity(0),
                          side: const BorderSide(color: Colors.white),
                          minimumSize: Size(size.width*0.5, 50)
                        ),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInPage()));

                            }, child: Text("Lets Dive In!",style: GoogleFonts.questrial(color: Colors.white,fontSize: 32),)),
                      ),
                    ),
                  )
                ],
              ),
            ),


          ]
        ),
      )
    );
  }
}
