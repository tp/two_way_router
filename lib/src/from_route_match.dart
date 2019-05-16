import 'package:two_way_router/two_way_router.dart';

abstract class FromRouteMatch {
  FromRouteMatch fromRouteMatch(RouteMatch routeMatch);
}

typedef MatchParserFunc<T> = T Function(RouteMatch);
