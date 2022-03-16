class Game {
  static int gameScore = 0;
  static List<String> choices = ["Batu", "Kertas", "Gunting"];
}

class GameChoice {
  String? type = "";
  static var gameRules = {
    "Batu": {
      "Batu": "Permainan Seri",
      "Kertas": "Anda Kalah",
      "Gunting": "Anda Menang",
    },
    "Kertas": {
      "Batu": "Anda Menang",
      "Kertas": "Permainan Seri",
      "Gunting": "Anda Kalah",
    },
    "Gunting": {
      "Batu": "Anda Kalah",
      "Kertas": "Anda Menang",
      "Gunting": "Permainan Seri",
    }
  };
  GameChoice(this.type);
}
