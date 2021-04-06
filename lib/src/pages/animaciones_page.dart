import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:provider/provider.dart';


class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      body: Center(
        child: CuadradoAnimado(color: accentColor,),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {

  final Color color;

  const CuadradoAnimado({@required this.color});

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> rotacion;

  Animation<double> opacidad;
  Animation<double> opacidadOut;
  
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() { 

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    // print('Status: ${controller.status}');
    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.repeat();
        // controller.reset();
      }
    });

    super.initState();
  
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Play - Reproducción
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(widget.color),
      builder: (BuildContext context, Widget childRectangulo) {
        print('opcadidad: ${opacidad.value}');
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
              ),
            )
          ),
        );
      },
    );
  }
}


class _Rectangulo extends StatelessWidget {

  final Color color;

  const _Rectangulo(this.color);


    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: this.color
       ),
     );
   }
}