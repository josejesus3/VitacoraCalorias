import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:vitacora_calorias/domain/data/data.dart';

// Clase que representa un alimento

class ListaAlimentos extends ChangeNotifier {
  List<Alimentos> listAlimentos = [];
  List<String> alimentoList = [];

  // Método para agregar alimentos a la lista y guardar en SharedPreferences
  void agregarAlimentos(String alimento, int proteina, int calorias) {
    // Crear una nueva instancia de Alimentos con los parámetros proporcionados
    Alimentos nuevoAlimento =
        Alimentos(alimento: alimento, proteina: proteina, calorias: calorias);

    // Agregar la nueva instancia a la lista existente
    listAlimentos.add(nuevoAlimento);

    // Convertir la lista de alimentos a una lista de cadenas JSON
    alimentoList = listAlimentos.map((alimento) {
      return jsonEncode(alimento.toMap()); 
    }).toList();

    // Guardar la lista de cadenas JSON en SharedPreferences
    _guardarLista();

    // Notificar a los oyentes que la lista ha cambiado
    notifyListeners();
  }

  // Método para eliminar la lista y guardar en SharedPreferences
  void eliminarLista() {
    alimentoList = listAlimentos.map((alimento) {
      return jsonEncode(alimento.toMap());
    }).toList();

    // Guardar la lista de cadenas JSON en SharedPreferences
    _guardarLista();
    notifyListeners();
  }

  // Método privado para guardar la lista en SharedPreferences
  void _guardarLista() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ListAlimentos', alimentoList);
  }

  // Método para cargar la lista desde SharedPreferences
  Future<void> cargarLista() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? alimentosJsonList =
        prefs.getStringList('ListAlimentos');

    if (alimentosJsonList != null) {
      // Limpiar la lista actual antes de cargar
      listAlimentos.clear();

      // Convertir la lista de cadenas JSON a una lista de Alimentos
      for (var alimentoJson in alimentosJsonList) {
        final Map<String, dynamic> alimentoMap = jsonDecode(alimentoJson);
        final Alimentos alimento = Alimentos.fromMap(alimentoMap);
        listAlimentos.add(alimento);
      }

      // Notificar a los oyentes que la lista ha cambiado
      notifyListeners();
    }
  }
}
