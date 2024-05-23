class OrigenAnimal {
  final List<Lacteo> lacteos;

  OrigenAnimal({
    required this.lacteos,
  });

  factory OrigenAnimal.fromJson(Map<String, dynamic> json) => OrigenAnimal(
        lacteos:
            List<Lacteo>.from(json["Lacteos"].map((x) => Lacteo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Lacteos": List<dynamic>.from(lacteos.map((x) => x.toJson())),
      };
}

class Lacteo {
  final String azucares;
  final String calcio;
  final int calorias;
  final String carbohidratos;
  final String colesterol;
  final String fibraDietetica;
  final String grasasSaturadas;
  final String grasasTotales;
  final String hierro;
  final String id;
  final String imagen;
  final String porcion;
  final String potasio;
  final String producto;
  final int proteinas;
  final String sodio;
  final String vitaminaA;
  final String vitaminaC;
  final String vitaminaD;

  Lacteo({
    required this.azucares,
    required this.calcio,
    required this.calorias,
    required this.carbohidratos,
    required this.colesterol,
    required this.fibraDietetica,
    required this.grasasSaturadas,
    required this.grasasTotales,
    required this.hierro,
    required this.id,
    required this.imagen,
    required this.porcion,
    required this.potasio,
    required this.producto,
    required this.proteinas,
    required this.sodio,
    required this.vitaminaA,
    required this.vitaminaC,
    required this.vitaminaD,
  });

  factory Lacteo.fromJson(Map<String, dynamic> json) => Lacteo(
        azucares: json["azucares"],
        calcio: json["calcio"],
        calorias: json["calorias"],
        carbohidratos: json["carbohidratos"],
        colesterol: json["colesterol"],
        fibraDietetica: json["fibra_dietetica"],
        grasasSaturadas: json["grasas_saturadas"],
        grasasTotales: json["grasas_totales"],
        hierro: json["hierro"],
        id: json["id"],
        imagen: json["imagen"],
        porcion: json["porcion"],
        potasio: json["potasio"],
        producto: json["producto"],
        proteinas: json["proteinas"],
        sodio: json["sodio"],
        vitaminaA: json["vitamina_A"],
        vitaminaC: json["vitamina_C"],
        vitaminaD: json["vitamina_D"],
      );

  Map<String, dynamic> toJson() => {
        "azucares": azucares,
        "calcio": calcio,
        "calorias": calorias,
        "carbohidratos": carbohidratos,
        "colesterol": colesterol,
        "fibra_dietetica": fibraDietetica,
        "grasas_saturadas": grasasSaturadas,
        "grasas_totales": grasasTotales,
        "hierro": hierro,
        "id": id,
        "imagen": imagen,
        "porcion": porcion,
        "potasio": potasio,
        "producto": producto,
        "proteinas": proteinas,
        "sodio": sodio,
        "vitamina_A": vitaminaA,
        "vitamina_C": vitaminaC,
        "vitamina_D": vitaminaD,
      };
}
