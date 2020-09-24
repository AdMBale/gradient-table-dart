import 'dart:html';
import 'package:angular/angular.dart';
import 'gradient_service.dart';

///Directive hosts by the table <td> tag to manipulate its attributes
@Directive(selector: '[gradient]', providers: [GradientService])
class ColorGradientDirective implements AfterChanges, OnInit {
  final headerBackgroundColor = 'lightgrey';
  GradientService _gradientService;
  HtmlElement actEl;
  Element el;
  var xCoord;
  var yCoord;

  ColorGradientDirective(this.el, this.actEl, this._gradientService);

  ///Horizontal coordinate value
  @Input("xIndex")
  var X;

  ///Vertical coordinate value
  @Input("yIndex")
  var Y;

  ///Column count
  @Input("count")
  var count;

  ///Sets the <td> tag's width and makes it square
  ngAfterChanges() {
    var activeCoulumnCount = int.parse(this.count) + 1;
    var percent = (100 / activeCoulumnCount).toString() + '%';
    this.el.style.width = percent;
    this.el.style.height = '0';
    this.el.style.paddingBottom = percent;
  }

  ///Sets the <td> tag's background color according to the coordinates
  ngOnInit() {
    xCoord = int.parse(this.X);
    yCoord = int.parse(this.Y);
    this.el.style.backgroundColor = xCoord == 0 || yCoord == 0
        ? this.el.style.backgroundColor = this.headerBackgroundColor
        : this
            ._gradientService
            .setGradientColor(xCoord - 1, yCoord - 1, int.parse(this.count));
  }
}
