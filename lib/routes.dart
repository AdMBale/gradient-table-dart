import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'src/gradient-table/gradient_table_component.template.dart'
    as gradient_template;

export 'route_paths.dart';

class Routes {
  static final gradient = RouteDefinition(
    routePath: RoutePaths.gradient,
    component: gradient_template.GradientTableComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    gradient,
  ];
}
