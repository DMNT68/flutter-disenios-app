import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideshowWidget extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const SlideshowWidget({
    @required this.slides,
    this.puntosArriba     = false,
    this.colorPrimario    = Colors.blue,
    this.colorSecundario  = Colors.grey,
    this.bulletPrimario   = 12.0,
    this.bulletSecundario = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (_)=> _SlideshowModel(),
       child: SafeArea(
         child: Center(
          child: Builder(
            builder: (BuildContext context) { 

              Provider.of<_SlideshowModel>(context).colorPrimario    = this.colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario  = this.colorSecundario;
              Provider.of<_SlideshowModel>(context).bulletPrimario   = this.bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;

              return  _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
             
             },
          )
         ),
       ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(this.puntosArriba) _Dots(this.slides.length),
        Expanded(
          child: _Slides(this.slides)
        ),
        if(!this.puntosArriba) _Dots(this.slides.length),

    ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index))
          
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(this.index);
 
  @override
  Widget build(BuildContext context) {

    final ssMOdel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;
    if(ssMOdel.currentPage >= index - 0.5 && ssMOdel.currentPage < index + 0.5 ){
      tamano = ssMOdel.bulletPrimario;
      color = ssMOdel.colorPrimario;
    } else {
      tamano = ssMOdel.bulletSecundario;
      color = ssMOdel.colorSecundario;
    }
    
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget>slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() { 
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });

  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Container(
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(
    this.slide,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  
  double _currentPage      = 0;
  Color _colorPrimario     = Colors.blue;
  Color _colorSecundario   = Colors.grey;
  double _bulletPrimario   = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage (double pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario (Color color) {
    this._colorPrimario = color;
  }
  
  Color get colorSecundario => this._colorSecundario;

  set colorSecundario (Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario (double valor) {
    this._bulletPrimario = valor;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario (double valor) {
    this._bulletSecundario = valor;
  }

}