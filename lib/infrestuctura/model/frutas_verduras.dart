class FrutasVerduras {
  final FrutasVerdurasClass frutasVerduras;

  FrutasVerduras({
    required this.frutasVerduras,
  });

  factory FrutasVerduras.fromJson(Map<String, dynamic> json) => FrutasVerduras(
        frutasVerduras: FrutasVerdurasClass.fromJson(json["Frutas_Verduras"]),
      );

  Map<String, dynamic> toJson() => {
        "Frutas_Verduras": frutasVerduras.toJson(),
      };
}

class FrutasVerdurasClass {
  final List<String> frutas;
  final List<String> verduras;

  FrutasVerdurasClass({
    required this.frutas,
    required this.verduras,
  });

  factory FrutasVerdurasClass.fromJson(Map<String, dynamic> json) =>
      FrutasVerdurasClass(
        frutas: List<String>.from(json["Frutas"].map((x) => x)),
        verduras: List<String>.from(json["Verduras"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Frutas": List<dynamic>.from(frutas.map((x) => x)),
        "Verduras": List<dynamic>.from(verduras.map((x) => x)),
      };
}
