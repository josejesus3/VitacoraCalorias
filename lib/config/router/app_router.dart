import 'package:go_router/go_router.dart';
import 'package:vitacora_calorias/presentation/screen/page_view_requisitos.dart';
import 'package:vitacora_calorias/presentation/screen/vitacora_calorias.dart';

final appRouter=GoRouter(
  initialLocation: '/',
  routes: [
  GoRoute( 
    path: '/',
    builder: (context, state) => const PageViewRequisitos(),

    ),
    GoRoute( 
    path: '/home',
    builder: (context, state) => const VitacoraCalorias(),

    )
]
);