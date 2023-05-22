import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';
import '../widgets/citybox.dart';

class ListCityPage extends StatelessWidget {
  //const HomePage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void cityBoxAction( cityData ) {
    print(cityData['name']);
  }


  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context)!.settings.arguments as int;
    //final continentIndex = ModalRoute.of(context)!.settings.arguments!.toInt();

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        var cities = [];
        for(var country in appdata.data[continentIndex]['countries']){
          cities.addAll( country['cities']);
        }
        
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            titulo: "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
            pageContext: context,
            showBack: true,
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index){
              return CityBox(
                data: cities[index],
                onTap: cityBoxAction,
              );
            })
          ),
        );
      }
    );
  }
}