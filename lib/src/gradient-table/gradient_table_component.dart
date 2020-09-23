import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'color_gradient_directive.dart';
import 'gradient_service.dart';

@Component(
    selector: 'gradient-table',
    directives: [coreDirectives, ColorGradientDirective],
    templateUrl: 'gradient_table.html',
    styleUrls: ['gradient_table.css'],
    providers: [GradientService])
class GradientTableComponent implements OnActivate {
  var index = 1;
  var array = [];
  int count = 0;
  GradientService _gradientService;

  GradientTableComponent(this._gradientService);

  @override
  void onActivate(_, RouterState current) {
    var params = current.parameters;
    if (params.length > 0) {
      this.count = int.parse(params['count']);
      this.array = List<int>.generate(this.count + 1, (int index) => index);
    } else
      window.alert('No router parameter has been passed!');
  }

  String getHeader(index) {
    return this._gradientService.getHeaderString(index - 1);
  }
}
