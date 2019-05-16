part of 'blog_router.dart';

class BlogRouter {
  BlogRouter();

  register<RouteDesciptionType>(List<RoutePart> parts) {
    if (RouteDesciptionType is! BlogRoute) {
      throw Exception('Cannot register route that is not BlogRoute');
    }

    // TODO: Parse type and create helper from/to `RouteMatch`
    if (RouteDesciptionType is PostRoute) {
      // TODO
    }

    // TODO

    print(RouteDesciptionType);
  }

  /* extends Router<BlogRoute> */
  Router build() {
    return null;
  }
}
