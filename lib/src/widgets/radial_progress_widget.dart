import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;


  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4
  });


  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() { 

    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200 ));
    super.initState();
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext contex, Widget child)  {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress((
              widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), 
              widget.colorPrimario, 
              widget.colorSecundario, 
              widget.grosorPrimario, 
              widget.grosorSecundario
            ),
        )
    );
      }
    );

    
  }
}


class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorPrimario;
   final Color colorSecundario;
   final double grosorPrimario;
   final double grosorSecundario;

  _MiRadialProgress(
    this.porcentaje, 
    this.colorPrimario,
    this.colorSecundario,
    this.grosorPrimario,
    this.grosorSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect =  new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180
    );

    final gradiente = new LinearGradient(
      colors: [
        Color(0xffc012ff),
        Color(0xff6D05E8),
        Colors.red,
      ]
    ); 

    // Círculo completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..strokeCap = StrokeCap.round
      ..color = colorPrimario
      // ..shader = gradiente.crxeateShader(rect)
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}