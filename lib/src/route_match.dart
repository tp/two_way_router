class RouteMatch {
  RouteMatch({this.positionalArguments, this.namedArguments});

  final List positionalArguments;
  final Map<Symbol, dynamic> namedArguments;
}
