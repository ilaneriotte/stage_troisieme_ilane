import 'package:flutter/material.dart';
import 'package:stage_ilane/animaux.dart';
import 'package:stage_ilane/description.dart';
import 'package:flutter/services.dart' show rootBundle;
import "sons.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  rootBundle.load("sons/chat.mp3").then((_) {
    Sons.chat = _.buffer.asUint8List();
    rootBundle.load("sons/chien.mp3").then((_) {
      Sons.chien = _.buffer.asUint8List();
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animaux'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildAnimaux2());
  }

  Widget buildAnimaux2() {
    List<Widget> list = [];
    list.add(
      Image(
        image: AssetImage('images/iconeapp.jpg'),
        height: 150,
      ),
    );
    list.addAll(
      animaux.map((animal) {
        bool estUnChien = animal.type == "Chien";

        return Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: Image(
                image: AssetImage(animal.image),
                height: 200,
              ),
              subtitle: Text(animal.type,
                  style: TextStyle(
                      color:
                          estUnChien ? Colors.green[800] : Colors.yellow[900])),
              title: Text(
                animal.nom,
              ),
              tileColor: Colors.grey.withAlpha(70),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => DescriptionScreen(animal)));
              },
            ),
          ],
        );
      }).toList(),
    );

    return ListView(
      children: list,
    );
  }
}
