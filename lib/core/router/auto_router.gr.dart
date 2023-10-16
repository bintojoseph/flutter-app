// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:exercise_app/presentation/details_page/screen_details_page.dart'
    as _i1;
import 'package:exercise_app/presentation/main_page/screen_main_page.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RouteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RouteDetailsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ScreenDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RouteMainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ScreenMainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ScreenDetailsPage]
class RouteDetailsRoute extends _i3.PageRouteInfo<RouteDetailsRouteArgs> {
  RouteDetailsRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          RouteDetailsRoute.name,
          args: RouteDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteDetailsRoute';

  static const _i3.PageInfo<RouteDetailsRouteArgs> page =
      _i3.PageInfo<RouteDetailsRouteArgs>(name);
}

class RouteDetailsRouteArgs {
  const RouteDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'RouteDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.ScreenMainPage]
class RouteMainRoute extends _i3.PageRouteInfo<void> {
  const RouteMainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          RouteMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteMainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
