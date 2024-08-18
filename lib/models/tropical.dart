class Tropical {
  final String glyphOne;
  final String planetName;
  final String glyphTwo;
  final String signName;
  final String float;
  final String retro;

  Tropical({
    required this.glyphOne,
    required this.planetName,
    required this.glyphTwo,
    required this.signName,
    required this.float,
    required this.retro,
  });

  Tropical copyWith({
    String? glyphOne,
    String? planetName,
    String? glyphTwo,
    String? signName,
    String? float,
    String? retro,
  }) {
    return Tropical(
      glyphOne: glyphOne ?? this.glyphOne,
      planetName: planetName ?? this.planetName,
      glyphTwo: glyphTwo ?? this.glyphTwo,
      signName: signName ?? this.signName,
      float: float ?? this.float,
      retro: retro ?? this.retro,
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      'glyphOne': glyphOne,
      'planetName': planetName,
      'glyphTwo': glyphTwo,
      'signName': signName,
      'float': float,
      'retro': retro,
    };
  }

  //list to json
  List<Map<String, dynamic>> listToJson(List<Tropical> list) {
    return list.map((item) => item.toJson()).toList();
  }
}
