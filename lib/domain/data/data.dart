class Alimentos {
  final String alimento;
  final int proteina;
  final int calorias;

  Alimentos({
    required this.alimento,
    required this.proteina,
    required this.calorias,
  });

  Map<String, dynamic> toMap() {
    return {
      'alimento': alimento,
      'proteina': proteina,
      'calorias': calorias,
    };
  }

  factory Alimentos.fromMap(Map<String, dynamic> map) {
    return Alimentos(
      alimento: map['alimento'],
      proteina: map['proteina'],
      calorias: map['calorias'],
    );
  }
}
