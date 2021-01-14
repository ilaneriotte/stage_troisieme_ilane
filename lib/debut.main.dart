import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Animal {
  String nom;
  String description;
  String type;
  String image;
  Animal({
    this.nom,
    this.description,
    this.type,
    this.image,
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
        body: buildAnimaux2()
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black38,
        //   onPressed: _incrementCounter,
        //   tooltip: 'caca',
        //   child: Icon(
        //     Icons.account_circle_outlined,
        //     color: Colors.white,
        //   ),
        // ),
        );
  }


  List<Animal> animaux = [
    Animal(
        nom: "Fender",
        type: "Chien",
        description: "",
        image: 'images/Fendere.jpg'),
    Animal(
        nom: "Babzi",
        type: "Chien",
        description: "",
        image: 'images/Babzi_2.jpg'),
    Animal(
        nom: "Lopping",
        type: "Chien",
        description: "",
        image: 'images/Looping.jpg'),
    Animal(
        nom: "Iska", type: "Chien", description: "", image: 'images/Iska.jpg'),
    Animal(
        nom: "Baya", type: "Chien", description: "", image: 'images/Baya.jpg'),
    Animal(
        nom: "Ebenne",
        type: "Chien",
        description: "",
        image: 'images/Ebenne.jpg'),
    Animal(
        nom: "Drana",
        type: "Chien",
        description: "",
        image: 'images/Drana.jpg'),
    Animal(
        nom: "Atesse",
        type: "Chien",
        description: "",
        image: 'images/Altesse.jpg'),
    Animal(
        nom: "Nuggets",
        type: "Chat",
        description: "",
        image: 'images/Nuggets.jpg'),
    Animal(
        nom: "Oreo", type: "Chat", description: "", image: 'images/Oreo.jpg'),
    Animal(
        nom: "Kino", type: "Chat", description: "", image: 'images/Kino.jpg'),
    Animal(
        nom: "Bobby", type: "Chat", description: "", image: 'images/Boby.jpg'),
    Animal(
        nom: "Métisse",
        type: "Chat",
        description: "",
        image: 'images/Métisse.jpg'),
    Animal(
        nom: "Luna", type: "Chat", description: "", image: 'images/Luna.jpg'),
    Animal(
        nom: "Hotchi",
        type: "Chat",
        description: "",
        image: 'images/Hotchi.jpg'),
  ];

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
        return Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: Image(
                image: AssetImage(animal.image),
                height: 200,
              ),
              subtitle: Text(animal.type),
              title: Text(
                animal.nom,
              ),
              tileColor: Colors.grey.withAlpha(70),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        );
      }).toList(),
    );

    return ListView(
      children: list,
    );
  }

  Widget buildAnimaux() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Fendere.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Fendere",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Babzi_2.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Babzi",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Looping.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Looping",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Iska.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Iska",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Baya.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Baya",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Ebenne.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Ebenne",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Drana.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Drana",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Altesse.jpg'),
            height: 200,
          ),
          subtitle: Text("Chien"),
          title: Text(
            "Altesse",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Nuggets_3.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Nuggets",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Oreo.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Oreo",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Kino.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Kino",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Boby.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Bobby",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Métisse.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Métisse",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Luna.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Luna",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image(
            image: AssetImage('images/Hotchi.jpg'),
            height: 200,
          ),
          subtitle: Text("Chat"),
          title: Text(
            "Hotchi",
          ),
          tileColor: Colors.grey.withAlpha(70),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),

        // Image(
        //   image: AssetImage('images/Fendere.jpg'),
        //   height: 200,
        // ),
        // Text(
        //   'Chat',
        // ),
        // Icon(
        //   Icons.power_off_sharp,
        //   color: Colors.amber,
        // ),
        // Text(
        //   'Ilane',
        // ),
        // Icon(Icons.pool, color: Colors.blue),
        // Text(
        //   'bonjour',
        // ),
        // Icon(Icons.access_alarms, color: Colors.blue),
        // Text(
        //   'Au revoir',
        // ),
        // Icon(
        //   Icons.how_to_reg,
        //   color: Colors.purple,
        // ),
      ],
    );
  }
}
