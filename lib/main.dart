import 'package:flutter/material.dart';
import 'package:stage_ilane/animaux.dart';
import 'package:stage_ilane/description.dart';
import 'package:flutter/services.dart' show rootBundle;
import "sons.dart";
import "jeu.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  rootBundle.load("sons/chat.mp3").then((_) {
    Sons.chat = _.buffer.asUint8List();
    rootBundle.load("sons/chien2.mp3").then((_) {
      Sons.chien = _.buffer.asUint8List();
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'AnimaListe'),
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
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.games),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (ctx) => JeuScreen()));
          //     },
          //   ),
          // ],
        ),
        body: buildAnimaux2());
  }

  int easterEgg = 0;

  Widget buildAnimaux2() {
    List<Widget> list = [];
    list.add(
      GestureDetector(
        onTap: () {
          easterEgg++;
          if (easterEgg > 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => JeuScreen()));
            easterEgg = 0;
          }
        },
        child: Image(
          image: AssetImage('images/iconeapp.jpg'),
          height: 150,
        ),
      ),
    );

    List<Animal> chiens =
        animaux.where((animal) => animal.type == "Chien").toList();
    List<Animal> chats =
        animaux.where((animal) => animal.type == "Chat").toList();

    list.add(Divider(
      thickness: 4,
      color: Colors.grey[300],
    ));

    list.add(Text(
      "Chiens",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.purple[200], fontSize: 25, fontWeight: FontWeight.w700),
    ));
    list.addAll(
      chiens.map((animal) => afficherAnimal(animal)).toList(),
    );

    list.add(Divider(
      thickness: 4,
      color: Colors.purple[100],
    ));
    list.add(Text(
      "Chats",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.pink[200], fontSize: 25, fontWeight: FontWeight.w700),
    ));

    list.addAll(
      chats.map((animal) => afficherAnimal(animal)).toList(),
    );

    SliverChildListDelegate sliverDelegate = new SliverChildListDelegate(list);
    return CustomScrollView(
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          sliver: new SliverList(
            delegate: sliverDelegate,
          ),
        )
      ],
    );
  }

  Widget afficherAnimal(Animal animal) {
    bool estUnChien = animal.type == "Chien";

    return Column(
      children: [
        SizedBox(height: 10),
        ListTile(
          leading: Hero(
            tag: animal.nom,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(animal.image),
            ),
          ),
          subtitle: Text(animal.type,
              style: TextStyle(
                  color: estUnChien ? Colors.green[800] : Colors.yellow[900],
                  fontSize: 15)),
          title: Text(
            animal.nom,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          tileColor: estUnChien ? Colors.purple[50] : Colors.pink[50],
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => DescriptionScreen(animal)));
          },
        ),
      ],
    );
  }
}
