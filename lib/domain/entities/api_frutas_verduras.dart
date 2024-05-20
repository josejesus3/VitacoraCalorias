class ApiFrutasVerduras {
  final List<String> frutas;
  final List<String> verduras;

  ApiFrutasVerduras({
    required this.frutas,
    required this.verduras,
  });

  factory ApiFrutasVerduras.fromJson(Map<String, dynamic> json) =>
      ApiFrutasVerduras(
        frutas: List<String>.from(json["Frutas"].map((x) => x)),
        verduras: List<String>.from(json["Verduras"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Frutas": List<dynamic>.from(frutas.map((x) => x)),
        "Verduras": List<dynamic>.from(verduras.map((x) => x)),
      };
}
