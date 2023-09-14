import 'package:flutter/material.dart';
import 'package:vibify/modals/colors.dart';

class PlayButtonFilled extends StatefulWidget {
  const PlayButtonFilled({super.key});

  @override
  State<PlayButtonFilled> createState() => _PlayButtonFilledState();
}

class _PlayButtonFilledState extends State<PlayButtonFilled> {
  IconData status= Icons.play_arrow_outlined;
  @override
  Widget build(BuildContext context) {
    myColors mcol=myColors();
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: mcol.neonblue,
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        boxShadow: [
          BoxShadow(color: mcol.neonblue,blurRadius: 20,spreadRadius: 1)
        ]
      ),
      child: GestureDetector(
          onTap: (){
            if(status==Icons.play_arrow_outlined){
              setState(() {
                status=Icons.pause;
              });
            }else{
              setState(() {
                status=Icons.play_arrow_outlined;
              });
            }
          },
          child: Icon(status,size: 60,)),
    );
  }
}
class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  IconData status= Icons.play_arrow;
  @override
  Widget build(BuildContext context){
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(80)),

      ),
      child: GestureDetector(
          onTap: (){
            if(status==Icons.play_arrow){
              setState(() {
                status=Icons.pause;
              });
            }else{
              setState(() {
                status=Icons.play_arrow;
              });
            }
          },
          child: Icon(status,size: 60,color: Colors.white,)),
    );
  }
}

