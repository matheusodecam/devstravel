import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreLoadPage extends StatefulWidget {
  const PreLoadPage({super.key});

  @override
  State<PreLoadPage> createState() => _PreLoadPageState();
}

class _PreLoadPageState extends State<PreLoadPage> {
  bool loading = true;

  void requestInfo() async {
    
    await Future.delayed(Duration(seconds: 1));
    
    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (req) {
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();
    
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/devstravel_logo.png',
              width: 200,
            ),
           
            loading ? Container(
              margin: EdgeInsets.all(30),
              child: Text(
                'Carregando Informações...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ) : Container(),

            loading ? CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ) : Container(),
            
            !loading ? OutlinedButton(
              onPressed: () {
                // Ação que será executada ao clicar no botão
              },
              child: Text('Tente Novamente'),
            ) : Container(),
            
          ],
        ),
      ),
    );
  }
}
