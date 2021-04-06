import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _BotonNuevaLista()
          )
        ],
      )
   );
  }
}

class _BotonNuevaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return RawMaterialButton(
      onPressed: (){},
      fillColor: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Color(0xffED6762),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
      ),
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: size.width * 0.7,
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mudo'),
        // ),
        SliverPersistentHeader(
          floating: true, 
          delegate: _SliverCustomDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo()
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100,)
          ],)
        )
      ],
    );
  }
}

class _SliverCustomDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;


  _SliverCustomDelegate({
    @required this.minHeight, 
    @required this.maxHeight, 
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child     != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'New', 
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey :Color(0xff532128), 
              fontSize: 50
            ),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child:Text('List', style: TextStyle(color: Color(0xffd93a30), fontSize: 50, fontWeight: FontWeight.bold),),
            ), 
            
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

  //   final items = [
  //   _ListItem( 'Orange', Color(0xffF08F66) ),
  //   _ListItem( 'Family', Color(0xffF2A38A) ),
  //   _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  //   _ListItem( 'Books', Color(0xffFCEBAF) ),
  //   _ListItem( 'Orange', Color(0xffF08F66) ),
  //   _ListItem( 'Family', Color(0xffF2A38A) ),
  //   _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  //   _ListItem( 'Books', Color(0xffFCEBAF) ),
  // ];

  final List<Widget> items;

  const _ListaTareas(this.items) ;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      height: 100,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        this.titulo, 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: 25
        ),
      ),
    );
  }
}