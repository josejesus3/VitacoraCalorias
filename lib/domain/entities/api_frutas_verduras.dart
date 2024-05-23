class FrutasVerdurasClass {
  final List<Resultado> resultado;

  FrutasVerdurasClass({
    required this.resultado,
  });

  factory FrutasVerdurasClass.fromJson(Map<String, dynamic> json) =>
      FrutasVerdurasClass(
        resultado: List<Resultado>.from(
            json["resultado"].map((x) => Resultado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultado": List<dynamic>.from(resultado.map((x) => x.toJson())),
      };
}

class Resultado {
  final String producto;
  final int proteinas;
  final int calorias;

  Resultado({
    required this.producto,
    required this.proteinas,
    required this.calorias,
  });

  factory Resultado.fromJson(Map<String, dynamic> json) => Resultado(
        producto: json["producto"],
        proteinas: json["proteinas"],
        calorias: json["calorias"],
      );

  Map<String, dynamic> toJson() => {
        "producto": producto,
        "proteinas": proteinas,
        "calorias": calorias,
      };
}
