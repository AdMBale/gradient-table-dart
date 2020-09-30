import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'color_gradient_directive.dart';
import 'gradient_service.dart';
import 'validate_service.dart';

///The gradient table component, renders the table cells with the calculated background color.
@Component(
    selector: 'gradient-table',
    directives: [coreDirectives, ColorGradientDirective],
    templateUrl: 'gradient_table.html',
    styleUrls: ['gradient_table.css'],
    providers: [GradientService, ValidateService])
class GradientTableComponent implements OnActivate {
  var index = 1;
  var array = [];
  var count = 0;
  GradientService _gradientService;
  ValidateService _validateService;

  GradientTableComponent(this._gradientService, this._validateService);

  ///The activated route navigation event, generates an array to table rows and columns
  @override
  void onActivate(_, RouterState current) {
    var params = current.parameters;
    if (params.length > 0 &&
        this._validateService.validateCountInput(params['count'])) {
      this.count = int.parse(params['count']);
      this.array = List<int>.generate(this.count + 1, (var index) => index);
    }
  }

  ///Gets the header string for the columns by [index]
  String getHeader(index) {
    return this._gradientService.getHeaderString(index - 1);
  }
}
