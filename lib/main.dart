import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_table_page.dart';
import 'package:disenos_app/src/models/layout_model.dart';
 
void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel())
    ],
    child: MyApp(),
  )
);
// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (_) => ThemeChanger(2),
//     child: MyApp()
//   )
// );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {

          final screeSize = MediaQuery.of(context).size;
          
          if (screeSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
          
          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),
    );
  }
}