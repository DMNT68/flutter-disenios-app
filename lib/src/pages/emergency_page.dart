import 'package:disenos_app/src/widgets/boton_gordo_widget.dart';
import 'package:disenos_app/src/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';


class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    
    if(MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List <Widget> itemMap = List.generate(items.length, (index) => FadeInLeft(
      duration: Duration(milliseconds: 250),
      child: BotonGordoWidget(
        text: items[index].texto, 
        onPress: (){ print(items[index].texto); },
        color1: items[index].color1,
        color2: items[index].color2,
        icon:  items[index].icon,
      ),
    ));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
               if(isLarge) SizedBox(height: 80,),
                ...itemMap,
              ]
            ),
          ),
           if(isLarge) _Encabezado()
        ],
      ),
   );
  }
}

class _Encabezado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus, 
          titulo: 'Asistencia médica', 
          subtitulo: 'Haz solicitado',
          color1: Color(0xff66A9F2), 
          color2: Color(0xff536CF6) ,
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BotonGordoWidget(
      text: 'Boton',
      onPress: () {print('boton gordo');},
      icon: FontAwesomeIcons.accusoft,
      color1: Color(0xff6989f5),
      color2: Color(0xff906ef5)
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
       icon: FontAwesomeIcons.plusCircle,
       subtitulo: 'Haz Solicitado',
       titulo: 'Asistencia Médica',
       color1: Color(0xff526bf6),
       color2: Color(0xff67acf2),
    );
  }
}