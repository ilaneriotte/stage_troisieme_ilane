import 'package:flutter/material.dart';

class JeuScreen extends StatefulWidget {
  JeuScreen({Key key}) : super(key: key);

  @override
  _JeuScreenState createState() => _JeuScreenState();
}

class _JeuScreenState extends State<JeuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("☺  Morpion Easteregg  ☺"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              child: buildZoneNouvellePartie(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(width: double.infinity, child: buildZoneDeJeu()),
            ),
            Container(
              child: buildZoneDeScores(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildZoneDeScores() {
    if (partieTerminee) {
      if (egalite) {
        // Afficher egalité
        return Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("égalité...",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey)),
              Text("Personne n'a gagné.",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey)),
            ],
          ),
        );
      } else {
        // Afficher un gagnant
        return Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Le joueur  " + joueurCourant + "  a gagné.",
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
              Text("Partie terminée.",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey)),
            ],
          ),
        );
      }
    }

    // Afficher le joueur en cours
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Au tour de  " + joueurCourant,
              style: TextStyle(fontSize: 30, color: Colors.blueGrey)),
          Text("Partie en cours...",
              style: TextStyle(fontSize: 30, color: Colors.blueGrey)),
        ],
      ),
    );
  }

  Widget dessineZone(int ligne, int colonne) {
    var zoneCourante = jeuEnCours[ligne - 1][colonne - 1];

    return Flexible(
      child: InkWell(
        onTap: () {
          jouer(ligne, colonne);
        },
        child: Container(
          margin: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.3,
          child: Center(
            child: Text(
              zoneCourante,
              style: TextStyle(
                  color: jeuEnCoursGagne[ligne - 1][colonne - 1]
                      ? Colors.yellow
                      : Colors.blueGrey,
                  fontSize: 100,
                  fontWeight: FontWeight.w900),
            ),
          ),
          color: Colors.deepOrange[300],
        ),
      ),
    );
  }

  var jeuEnCours = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];

  void jouer(int ligne, int colonne) {
    if (partieTerminee) {
      return;
    }
    var zoneCourante = jeuEnCours[ligne - 1][colonne - 1];
    if (zoneCourante != "") {
      return;
    }
    setState(() {
      jeuEnCours[ligne - 1][colonne - 1] = joueurCourant;
      if (verifierPartie(joueurCourant)) {
        // IL A GAGNE => Afficher le resultat du gagnant
        partieTerminee = true;
        return;
      }
      if (estPartieTerminee()) {
        // IL Y A EGALITE
        partieTerminee = true;
        egalite = true;
        return;
      }
      joueurCourant = joueurCourant == "X" ? "O" : "X";
    });
  }

  var joueurCourant = "X";
  bool partieTerminee = false;
  bool egalite = false;

  void nouvellePartie() {
    setState(() {
      partieTerminee = false;
      egalite = false;
      joueurCourant = "X";
      jeuEnCours = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""],
      ];
      jeuEnCoursGagne = [
        [
          false,
          false,
          false,
        ],
        [
          false,
          false,
          false,
        ],
        [
          false,
          false,
          false,
        ],
      ];
    });
  }

  var jeuEnCoursGagne = [
    [
      false,
      false,
      false,
    ],
    [
      false,
      false,
      false,
    ],
    [
      false,
      false,
      false,
    ],
  ];

  bool verifierPartie(String joueur) {
    if (jeuEnCours[0][0] == joueur &&
        jeuEnCours[0][1] == joueur &&
        jeuEnCours[0][2] == joueur) {
      jeuEnCoursGagne[0][0] = true;
      jeuEnCoursGagne[0][1] = true;
      jeuEnCoursGagne[0][2] = true;
      return true;
    }

    if (jeuEnCours[1][0] == joueur &&
        jeuEnCours[1][1] == joueur &&
        jeuEnCours[1][2] == joueur) {
      jeuEnCoursGagne[1][0] = true;
      jeuEnCoursGagne[1][1] = true;
      jeuEnCoursGagne[1][2] = true;
      return true;
    }

    if (jeuEnCours[2][0] == joueur &&
        jeuEnCours[2][1] == joueur &&
        jeuEnCours[2][2] == joueur) {
      jeuEnCoursGagne[2][0] = true;
      jeuEnCoursGagne[2][1] = true;
      jeuEnCoursGagne[2][2] = true;
      return true;
    }

    if (jeuEnCours[0][0] == joueur &&
        jeuEnCours[1][0] == joueur &&
        jeuEnCours[2][0] == joueur) {
      jeuEnCoursGagne[0][0] = true;
      jeuEnCoursGagne[1][0] = true;
      jeuEnCoursGagne[2][0] = true;
      return true;
    }

    if (jeuEnCours[0][1] == joueur &&
        jeuEnCours[1][1] == joueur &&
        jeuEnCours[2][1] == joueur) {
      jeuEnCoursGagne[0][1] = true;
      jeuEnCoursGagne[1][1] = true;
      jeuEnCoursGagne[2][1] = true;
      return true;
    }

    if (jeuEnCours[0][2] == joueur &&
        jeuEnCours[1][2] == joueur &&
        jeuEnCours[2][2] == joueur) {
      jeuEnCoursGagne[0][2] = true;
      jeuEnCoursGagne[1][2] = true;
      jeuEnCoursGagne[2][2] = true;
      return true;
    }

    if (jeuEnCours[0][0] == joueur &&
        jeuEnCours[1][1] == joueur &&
        jeuEnCours[2][2] == joueur) {
      jeuEnCoursGagne[0][0] = true;
      jeuEnCoursGagne[1][1] = true;
      jeuEnCoursGagne[2][2] = true;
      return true;
    }

    if (jeuEnCours[0][2] == joueur &&
        jeuEnCours[1][1] == joueur &&
        jeuEnCours[2][0] == joueur) {
      jeuEnCoursGagne[0][2] = true;
      jeuEnCoursGagne[1][1] = true;
      jeuEnCoursGagne[2][0] = true;
      return true;
    }

    return false;
  }

  bool estPartieTerminee() {
    for (int l = 0; l < 3; l++) {
      for (int c = 0; c < 3; c++) {
        if (jeuEnCours[l][c] == "") {
          return false;
        }
      }
    }
    return true;
  }

  Widget buildZoneDeJeu() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dessineZone(1, 1),
                dessineZone(1, 2),
                dessineZone(1, 3),
              ],
            ),
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dessineZone(2, 1),
                dessineZone(2, 2),
                dessineZone(2, 3),
              ],
            ),
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dessineZone(3, 1),
                dessineZone(3, 2),
                dessineZone(3, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildZoneNouvellePartie() {
    return RaisedButton(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Nouvelle Partie",
          style: TextStyle(color: Colors.white60, fontSize: 20),
        ),
      ),
      color: Colors.red[300],
      onPressed: () {
        nouvellePartie();
      },
    );
  }
}
