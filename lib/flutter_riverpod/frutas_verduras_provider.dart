import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitacora_calorias/domain/entities/api_frutas_verduras.dart';
import 'package:vitacora_calorias/flutter_riverpod/app_fit_riverpod.dart';


final frutasVerdurasProvider = FutureProvider<ApiFrutasVerduras>((ref) async {
  return ref.watch(appFitRiverpod).getFrutasVerduras();
});
