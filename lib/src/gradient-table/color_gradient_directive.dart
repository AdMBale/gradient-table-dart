import 'dart:html';
import 'package:angular/angular.dart';
import 'gradient_service.dart';

@Directive(selector: '[tblGradient]', providers: [GradientService])
class ColorGradientDirective implements AfterChanges, OnInit {
  GradientService _gradientService;
  HtmlElement actEl;
  Element el;
  int xCoord;
  int yCoord;
  ColorGradientDirective(this.el, this.actEl, this._gradientService) {}

  @Input("xIndex")
  String X;
  @Input("yIndex")
  String Y;
  @Input("count")
  String count;

  ngAfterChanges() {
    // this.el.style.height = this.actEl.clientWidth.toString() + 'px';
    int c = int.parse(this.count) + 1;
    var percent = (100 / c).toString() + '%';
    this.el.style.width = percent;
    this.el.style.height = '0';
    this.el.style.paddingBottom = percent;
  }

  ngOnInit() {
    xCoord = int.parse(this.X);
    yCoord = int.parse(this.Y);
    this.el.style.backgroundColor = xCoord == 0 || yCoord == 0
        ? this.el.style.backgroundColor = 'lightgrey'
        : this
            ._gradientService
            .setGradientColor(xCoord - 1, yCoord - 1, int.parse(this.count));
  }
}
