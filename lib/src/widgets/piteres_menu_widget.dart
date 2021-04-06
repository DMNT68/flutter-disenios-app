import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed, 
    @required this.icon
  });
  
}

class PiterestMenuWidget extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;


  PiterestMenuWidget({
    this.mostrar = true, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black, 
    this.inactiveColor = Colors.blueGrey, 
    @required this.items
  });
 

 /*  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icons pie_chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){print('Icons search');}),
    PinterestButton(icon: Icons.notifications, onPressed: (){print('Icons notifications');}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icons supervised_user_circle');}),
  ]; */

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
      child: Builder(
         builder: (BuildContext context) {

           Provider.of<_MenuModel>(context).backgroundColor= this.backgroundColor;
           Provider.of<_MenuModel>(context).activeColor= this.activeColor;
           Provider.of<_MenuModel>(context).inactiveColor= this.inactiveColor;


          return AnimatedOpacity(
            opacity: mostrar ? 1 : 0,
            duration: Duration(milliseconds: 250),
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        }
      )
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  _PinterestMenuBackground({@required this.child});


  @override
  Widget build(BuildContext context) {

  final Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);
  

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    double size = 0;
    Color color;
    if (itemSeleccionado == index) {
      color = activeColor;
      size = 35;
    } else {
      color = inactiveColor;
      size = 25;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}


class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor (Color color) {
    this._backgroundColor = color;
    
  }

  Color get activeColor => this._activeColor;
  set activeColor (Color color) {
    this._activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor (Color color) {
    this._inactiveColor = color;
  }

}