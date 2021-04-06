import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordoWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordoWidget({
    @required this.text, 
    @required this.onPress,
    this.icon = FontAwesomeIcons.carCrash, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonGordoBackground(this.icon, this.color1, this.color2, this.text,this.onPress),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;
  final String text;
   final Function onPress;

  const _BotonGordoBackground(this.icon, this.color1, this.color2, this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color> [
            this.color1,
            this.color2,
          ]
        )
      ),
      child: RawMaterialButton(
        onPressed: this.onPress,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: FaIcon(this.icon, size: 150, color: Colors.white.withOpacity(0.2),)),
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40,),
              FaIcon(this.icon, color: Colors.white, size: 40,),
              SizedBox(width: 20,),
              Expanded(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
              SizedBox(width: 40,),
            ],
          )
            ],
          ),
        ),
      ),
    );
  }
}