import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';
import '../widgets/citybox.dart';

class ContinentPage extends StatelessWidget {
  //const HomePage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void seeCityAction( context, continentIndex ) {
    print(continentIndex);

    Navigator.pushNamed(context, '/listcity', arguments: continentIndex!);
  }

  void cityBoxAction( cityData ) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          titulo: 'Escolha um continente',
          pageContext: context,
          hideSearch: false,
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            
            var cities = [];

            for(var country in appdata.data[index]['countries']){
              cities.addAll(country['cities']);
            }
            
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "${appdata.data[index]['name']} (${cities.length})",
                        style: TextStyle(
                          color: Colors.black, 
                          fontSize: 14, 
                          //fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        seeCityAction( context,index );
                      },
                      child: Text(
                        'Ver cidades',
                        style: TextStyle(
                          color: Colors.grey, 
                          fontSize: 13, 
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 130,
                  margin: EdgeInsets.only(bottom: 18),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex) {
                      return CityBox(
                        data: cities[cityIndex],
                        onTap: cityBoxAction,   
                      );
                    } 
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
