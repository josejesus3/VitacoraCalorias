
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
    final List<Resultado> resultado;

    FrutasVerdurasClass({
        required this.resultado,
    });

    factory FrutasVerdurasClass.fromJson(Map<String, dynamic> json) => FrutasVerdurasClass(
        resultado: List<Resultado>.from(json["resultado"].map((x) => Resultado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultado": List<dynamic>.from(resultado.map((x) => x.toJson())),
    };
}

class Resultado {
    final String name;
    final int proteina;
    final int calorias;

    Resultado({
        required this.name,
        required this.proteina,
        required this.calorias,
    });

    factory Resultado.fromJson(Map<String, dynamic> json) => Resultado(
        name: json["name"],
        proteina: json["proteina"],
        calorias: json["calorias"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "proteina": proteina,
        "calorias": calorias,
    };
}
