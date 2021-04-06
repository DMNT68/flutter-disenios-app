import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCirculares extends StatefulWidget {
  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appTheme.accentColor,
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: SafeArea(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue,),
                CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.red,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.pink,),
                CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.purple,)
              ],
            ),
          ],
        ),
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final double porcentaje;
  final Color color;

  const CustomRadialProgress({ 
    @required this.porcentaje,
    @required this.color, 
  });


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final screeSize = MediaQuery.of(context).size;

    double size;

    if (screeSize.height > 500) {
      size = 180;
    } else {
      size = 150;
    }
    
    return Container(
      width:size,
      height: size,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color, 
        colorSecundario: appTheme.textTheme.bodyText1.color, 
        grosorPrimario: 10, 
        grosorSecundario: 4,
      ),
    );
  }
}