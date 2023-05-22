import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget CustomAppBar({
  GlobalKey<ScaffoldState>? scaffoldKey,
  BuildContext? pageContext,
  String titulo = '',
  bool hideSearch = false,
  bool showBack = false,
}) {
  
  void searchAction() {
    Navigator.pushReplacementNamed(pageContext!, '/search');
  }

  IconButton drawerIcon = IconButton(
      onPressed:() {
        scaffoldKey?.currentState?.openDrawer();
      }, 
      icon: Icon(Icons.menu, color: Colors.black, size: 30,)
  );

  IconButton backIcon = IconButton(
      onPressed:() {
        Navigator.pop(pageContext!);
      }, 
      icon: Icon(Icons.arrow_back, color: Colors.black, size: 30,)
  );

  IconButton leadingButton = drawerIcon;
  
  if(showBack){
    leadingButton = backIcon;
  }

  return AppBar(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    centerTitle: false,
    title: Text(
      titulo,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Helvetica Neue',
      ),
    ),
    
    leading: leadingButton,

    actions: <Widget>[
      !hideSearch ? IconButton(
        onPressed: searchAction, 
        icon: Icon(Icons.search, color: Colors.black, size: 30,)
      ) : Container(),
    ],
  );
}