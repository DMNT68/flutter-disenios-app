import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/piteres_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_)=>_MenuModel(),
      child: Scaffold(
        // PiterestMenuWidget()
        //  PinterestGrid(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ) 
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

     double widthPantalla = MediaQuery.of(context).size.width;
     final mostrar = Provider.of<_MenuModel>(context).mostrar;
     final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (widthPantalla > 500) {
      widthPantalla = widthPantalla - 300;
    }


    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Row(
          children: [
            Spacer(),
            PiterestMenuWidget(
              mostrar: mostrar,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              // inactiveColor: Colors.black54,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icons pie_chart');}),
                PinterestButton(icon: Icons.search, onPressed: (){print('Icons search');}),
                PinterestButton(icon: Icons.notifications, onPressed: (){print('Icons notifications');}),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icons supervised_user_circle');}),
              
              ],
            ),
            Spacer(),
          ],
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();


}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() { 
    super.initState();
    
    controller.addListener(() {
      
      if (controller.offset >  scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar =  false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar =  true;
      }

      scrollAnterior = controller.offset;

    });
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;
    
    if(MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PiterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PiterestItem extends StatelessWidget {

  final int index;

  const _PiterestItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  
  bool _mostrar = true;
  
  bool get mostrar => this._mostrar;
  
  set mostrar (bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }

}