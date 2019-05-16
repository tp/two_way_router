import 'package:two_way_router/src/route_parts.dart';
import 'package:two_way_router/two_way_router.dart';

class Router {
  Router(this.routes);

  final List<RouteMapping> routes;

  /// Returns the first route matching the [path], else `null`.
  RouteMapping match(String path) {
    for (final route in routes) {
      if (_matchesRoute(path, route)) {
        return route;
      }
    }

    return null;
  }
}

bool _matchesRoute(String path, RouteMapping route) {
  // print(_regExpForroute(route));
  return _regExpForroute(route).hasMatch(path);
}

RegExp _regExpForroute(RouteMapping route) {
  String regexpString = r'^';

  for (final part in route.parts) {
    if (part is LiteralRoutePart) {
      regexpString += '/${part.literal}';
    } else if (part is StringPathParameter) {
      regexpString += r'\/([^\\/]+)';
    } else {
      throw Exception('Unexpected route part type $part');
    }
  }

  regexpString += r'$';

  return RegExp(regexpString);
}

T Function(String) route<T>(
    MatchParserFunc<T> matchParser, RouteMapping route) {
  return (input) {
    final r = _regExpForroute(route);

    print(r);

    final matches = r.allMatches(input).toList();

    print(matches.length);

    int parameterGroupIndex = 0;

    final positionalArguments = [];

    for (int i = 0; i < route.parts.length; i++) {
      final part = route.parts[i];

      if (part is StringPathParameter) {
        final groupString = matches[parameterGroupIndex].group(1); // why 1?
        parameterGroupIndex++;

        print('groupString $groupString');

        positionalArguments.add(groupString);
      }
    }

    final routeMatch = RouteMatch(positionalArguments: positionalArguments);

    return matchParser(routeMatch);
  };
}

abstract class FromRouteMatch {
  FromRouteMatch fromRouteMatch(RouteMatch routeMatch);
}
