import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/theme/theme.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.accentColor,
        title: Text('Diseños en Flutter - Tablet'),
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme ? Colors.grey : appTheme.currentTheme.accentColor),
          ),

          Expanded(
            child: layoutModel.currentPage
          )
        ],
      ),
      // body: _ListaOpciones(),
   );
  }
}


class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(color: appTheme.primaryColorLight,),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor,),
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context,listen: false);
          layoutModel.currentPage = pageRoutes[i].page;

        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        color: appTheme.currentTheme.scaffoldBackgroundColor,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('AS', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones()
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value:  appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}