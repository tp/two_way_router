import 'package:two_way_router/src/route_parts.dart';

import 'package:two_way_router/two_way_router.dart';

class RouteMapping {
  const RouteMapping(this.mapper, this.parts)
      : assert(mapper != null),
        assert(parts != null);

  final RouteDescriptionMapper mapper;
  final List<RoutePart> parts;
}

abstract class RouteDescriptionMapper<T> {
  T fromRouteMatch(RouteMatch routeMatch);

  RouteMatch toRouteMatch(T instance);
}

RouteMapping route(RouteDescriptionMapper mapper, List<RoutePart> route) {
  throw Exception('route not implemented');
}
