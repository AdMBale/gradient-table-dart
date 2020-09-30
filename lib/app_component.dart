import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'routes.dart';
import 'src/gradient-table/gradient_table_component.dart';
import 'src/gradient-table/validate_service.dart';

@Component(
  selector: 'my-app',
  directives: const [
    formDirectives,
    coreDirectives,
    routerDirectives,
    GradientTableComponent
  ],
  providers: [ValidateService],
  exports: [RoutePaths, Routes],
  templateUrl: 'app_component.html',
)
class AppComponent {
  var columnCount;
  final Router _router;
  ValidateService _validateService;

  AppComponent(this._router, this._validateService);

  ///Validates the input field value by button click event
  ///and navigate to table creation accordingly
  onButtonClick() {
    if (this._validateService.validateCountInput(this.columnCount))
      this._router.navigate('gradient/' + columnCount);
  }

  ///On enter key calls the onButtonClick function to navigate
  onKeyUp(event) {
    if (event.keyCode == 13) {
      this.onButtonClick();
    }
  }
}
