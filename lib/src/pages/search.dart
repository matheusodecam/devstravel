import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';

class SearchPage extends StatelessWidget {
  //const HomePage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          titulo: 'Busque uma cidade',
          pageContext: context,
          hideSearch: true,
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text('Pagina de busca'),
            ],
          ),
        ),
      ),
    );
  }
}