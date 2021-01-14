import 'package:flutter/material.dart';
import 'package:stage_ilane/animaux.dart';

class DescriptionScreen extends StatefulWidget {
  final Animal animal;
  DescriptionScreen(this.animal, {Key key}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  Animal animal;

  @override
  void initState() {
    this.animal = this.widget.animal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.nom),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15, width: double.infinity),
                  Image(
                    image: AssetImage(animal.image),
                    height: 200,
                  ),
                  Text("Nom : " + animal.nom,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                  Divider(),
                  Text("surnom : " + animal.surnom,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.normal)),
                  Text(animal.type,
                      style: TextStyle(fontSize: 25, color: Colors.blueGrey)),
                  Text(animal.sexe,
                      style: TextStyle(fontSize: 25, color: Colors.blueGrey)),
                  Text(animal.vivant ? "Vivant" : "Mort",
                      style: TextStyle(fontSize: 25, color: Colors.blueGrey)),
                  Divider(),
                  Text(
                    animal.description,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
