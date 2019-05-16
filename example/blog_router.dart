import 'package:two_way_router/src/route_parts.dart';
import 'package:two_way_router/two_way_router.dart';

part 'blog_router.g.dart';

// annotate
abstract class BlogRoute {}

/*
// rocket.rs

#[get("/hello/<name>/<age>")]
fn hello(name: String, age: u8) -> String {
    format!("Hello, {} year old named {}!", age, name)
}

rocket::ignite().mount("/", routes![hello]).launch();
*/

class ImprintRoute extends BlogRoute {}

class PostRoute extends BlogRoute {
  PostRoute(this.postId);

  final int postId;
}

// final onePartRoute = route();
// final twoPartRoute = RouteMapping.RouteMapping([
//   LiteralRoutePart('user'),
//   LiteralRoutePart('timm'),
// ]);

final router = BlogRouter()
  ..register<ImprintRoute>([lit('impressum')])
  ..register<PostRoute>([lit('posts'), pathParamter<int>()]).build();

// ([
//   onePartRoute,
//   twoPartRoute,
// ]);
