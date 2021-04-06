import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;

  Animation<double> moverDerecha;
  Animation<double> moverArriba;
  Animation<double> moverIzquierda;
  Animation<double> moverAbajo;

  @override
  void initState() { 
    super.initState();

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

     moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );
     moverArriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
    );
     moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
    );
     moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1, curve: Curves.bounceOut))
    );


    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.repeat();
        // controller.reset();
      }
    });

    
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
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value, moverArriba.value + moverAbajo.value),
          child: childRectangulo,
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}