import "sons.dart";
import "dart:typed_data";

class Animal {
  String nom;
  String description;
  String type;
  String image;
  String sexe;
  bool vivant;
  String surnom;
  Uint8List get son => this.type == "Chien" ? Sons.chien : Sons.chat;
  Animal({
    this.nom,
    this.surnom = "aucun",
    this.description,
    this.type,
    this.image,
    this.sexe = "",
    this.vivant = true,
  });
}

List<Animal> animaux = [
  Animal(
      nom: "Fender",
      type: "Chien",
      description: "Petit chien minion mais un peu débile.",
      image: 'images/Fendere.jpg',
      sexe: "male",
      surnom: "Fenfen"),
  Animal(
      nom: "Babzi",
      type: "Chien",
      description:
          "Une chienne toute fofolle qui fait que manger les affaire des autre et les caca des autres et aime bien les promenades.",
      image: 'images/Babzi_2.jpg',
      sexe: "femelle",
      surnom: "Babab"),
  Animal(
      nom: "Looping",
      type: "Chien",
      description:
          "Chien roux qui aime bien jouer avec les autres mais qui peut attaquer les chiens qui l'embêtent et aime bien les promenades.",
      image: 'images/Looping.jpg',
      sexe: "male",
      surnom: "Looploop"),
  Animal(
      nom: "Iska",
      type: "Chien",
      description:
          "Une grande chienne qui ne fait que dormir et manger de ses journées et mettre des poil partout.",
      image: 'images/Iska.jpg',
      sexe: "femelle"),
  Animal(
      nom: "Baya",
      type: "Chien",
      description: "Gros patapouf qui dors sur le fauteuil toute la journée.",
      image: 'images/Baya.jpg',
      sexe: "femelle",
      surnom: "Patapouf"),
  Animal(
      nom: "Ebenne",
      type: "Chien",
      description: "Très gros chien qui aime bien les promenades et dormir.",
      image: 'images/Ebenne.jpg',
      sexe: "male",
      vivant: false),
  Animal(
      nom: "Drana",
      type: "Chien",
      description:
          "Petite chienne mignone et un petit peu enveloppée qui aime se promener et te suivre.",
      image: 'images/Drana.jpg',
      sexe: "femelle",
      surnom: "Rana",
      vivant: false),
  Animal(
      nom: "Altesse",
      type: "Chien",
      description:
          "Petite chienne adorable qui dors beaucoup et sui aime les caresses.",
      image: 'images/Altesse.jpg',
      sexe: "femelle",
      vivant: false),
  Animal(
      nom: "Nuggets",
      type: "Chat",
      description:
          "un chat roux mignon tout doux et joueur qui sens toujours bon et qui aime bien la pâté et sortir.",
      image: 'images/Nuggets.jpg',
      sexe: "male",
      surnom: "Nuggy, Mimi"),
  Animal(
      nom: "Oreo",
      type: "Chat",
      description:
          "petit chat mignon et tout doux avec des long poils et qui aime bien la pâté et sortir",
      image: 'images/Oreo.jpg',
      sexe: "male",
      surnom: "Boule de poils, Mimi"),
  Animal(
      nom: "Dewey",
      type: "Chat",
      description:
          "grand chat mignon qui aime bien les calin et qui est joueur, il aime bien sortir et tous salir lorsqu'il rentre.",
      image: 'images/dewey.jpeg',
      sexe: "male",
      surnom: "Didi"),
  Animal(
      nom: "Kino",
      type: "Chat",
      description:
          "gros chat qui a pris du poid avec le temps et qui aime bien te mordre et te griffer.",
      image: 'images/Kino.jpg',
      sexe: "male",
      surnom: "Kiki, Kiko la baleine"),
  Animal(
      nom: "Bobby",
      type: "Chat",
      description:
          "Petit chat atteint du cida qui passe ca journée a dormir et manger",
      image: 'images/Boby.jpg',
      vivant: false,
      sexe: "male",
      surnom: "Bobzi"),
  Animal(
      nom: "Métisse",
      type: "Chat",
      description: "Chat gris et agile qui adore les câlins.",
      image: 'images/Métisse.jpg',
      sexe: "femelle",
      vivant: false),
  Animal(
      nom: "Luna",
      type: "Chat",
      description: "Chat mignon qui aime beaucoup les câlins et qui est agile.",
      image: 'images/Luna.jpg',
      sexe: "femelle",
      vivant: false),
  Animal(
      nom: "Hotchi",
      type: "Chat",
      description:
          "Un chat fou furieux qui aime les caresse et qui est très joueur.",
      image: 'images/Hotchi.jpg',
      sexe: "male",
      vivant: false),
];
