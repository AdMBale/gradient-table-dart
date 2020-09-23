import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'routes.dart';
import 'src/gradient-table/gradient_table_component.dart';

@Component(
  selector: 'my-app',
  directives: const [
    formDirectives,
    coreDirectives,
    routerDirectives,
    GradientTableComponent
  ],
  exports: [RoutePaths, Routes],
  templateUrl: 'app_component.html',
)
class AppComponent {
  var columnCount;
  final Router _router;

  AppComponent(this._router);

  onButtonClick() {
    if (this.columnCount == null || this.columnCount == '') {
      window.alert('Please, enter a value!');
      return;
    }
    int count = int.tryParse(this.columnCount);
    if (count == null)
      window.alert('The number must be an integer!');
    else if (count < 2 || count > 100)
      window.alert('The number must be between 2 and 100!');
    else
      this._router.navigate('gradient/' + columnCount);
  }
}
