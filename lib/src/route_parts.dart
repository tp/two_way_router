import 'package:meta/meta.dart';

@immutable
abstract class RoutePart {}

class LiteralRoutePart implements RoutePart {
  LiteralRoutePart(this.literal);

  final String literal;
}

class StringPathParameter implements RoutePart {
  StringPathParameter();
}

class _IntPathParameter implements RoutePart {
  _IntPathParameter();
}

final lit = (String literal) => LiteralRoutePart(literal);

RoutePart pathParamter<T>() {
  if (T == String) {
    return StringPathParameter();
  }

  if (T == int) {
    return _IntPathParameter();
  }

  throw Exception('Unsupported paramter type $T');
}
