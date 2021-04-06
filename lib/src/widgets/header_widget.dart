import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0XFF615AAB),
    );
  }
}

class HeaderBordesRedodeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0XFF615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)  
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(), 
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    
    // Propiedades
    lapiz.color = Color(0XFF615AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height*0.35);
    path.lineTo(size.width, size.height*0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(), 
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    
    // Propiedades
    lapiz.color = Color(0XFF615AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(), 
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    
    // Propiedades
    lapiz.color = Color(0XFF615AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    // path.moveTo(0, size.height*0.35);
    path.lineTo(0, size.height*0.20);
    path.lineTo(size.width*0.5, size.height*0.25);
    path.lineTo(size.width, size.height*0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(), 
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    
    // Propiedades
    lapiz.color = Color(0XFF615AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.40, size.width, size.height*0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  final Color color;

  const HeaderWave({
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(color), 
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    
    // Propiedades
    lapiz.color = this.color; //Color(0XFF615AAB);
    // lapiz.style = PaintingStyle.stroke;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.30, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.20, size.width, size.height*0.25);
    path.lineTo(size.width, 0);

    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.25, size.height*0.70, size.width*0.5, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.75, size.height*0.8, size.width, size.height*0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaveGradiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0XFF615AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientePainter(), 
      ),
    );
  }
}

class _HeaderWaveGradientePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0,55.0),
      radius: 180
    );

    // Definimos el colores del gradiente
    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0XFF6D05E8),
        Color(0XFFC012FF),
        Color(0XFF6D05FA),
      ]
      ,stops: [0.2, 0.5 ,1.0]
    );
    
    final lapiz = new Paint()..shader = gradiente.createShader(rect);
    
    // Propiedades
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  new Path();

    // Dibujar con el path y el lapiz
    
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.30, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.20, size.width, size.height*0.25);
    path.lineTo(size.width, 0);

    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.25, size.height*0.70, size.width*0.5, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.75, size.height*0.8, size.width, size.height*0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children:[
        _IconHeaderBackground(color1: this.color1, color2: this.color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2),) 
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitulo, style: TextStyle(fontSize: 20, color: colorBlanco),),
            SizedBox(height: 20,),
            Text(this.titulo, style: TextStyle(fontSize: 30, color: colorBlanco, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            FaIcon(this.icon, size: 80, color: Colors.white,) 
          ],
        )
      ]
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  
  const _IconHeaderBackground({
    @required this.color1,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
              this.color1,
              this.color2,

          ]
        )
      ),
    );
  }
}