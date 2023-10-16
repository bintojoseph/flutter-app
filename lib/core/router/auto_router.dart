import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/presentation/details_page/screen_details_page.dart';

import 'auto_router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends $AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: RouteDetailsRoute.page),
    AutoRoute(page: RouteMainRoute.page , initial: true),  
   ];    
 }