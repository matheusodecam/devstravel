import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';

class HomePage extends StatelessWidget {
  //const HomePage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          titulo: 'Pagina Home',
          pageContext: context,
          hideSearch: false,
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Bem vindo(a) ao', style: styles
                ),
              ),

              Image.asset(
                'lib/assets/devstravel_logo.png',
                width: 200,
              ),

              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  'Seu guia de viagem perfeito', style: styles
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}