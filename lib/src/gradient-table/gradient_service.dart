import 'dart:html';

class GradientService {
  setGradientColor(i, j, count) {
    var colorSegment = this.getColorSegment(i, j, count).toString();
    if (i == 0 && j == 0)
      return 'rgb(255, 255, 255)';
    else if (i == (count - 1) && j == (count - 1))
      return 'rgb(255, 0, 0)';
    else {
      return 'rgb(255,' + colorSegment + ',' + colorSegment + ')';
    }
  }

  getColorSegment(int i, int j, int count) {
    var cellValue = (i + j) / 2;
    return 255 - (255 * (cellValue / count));
  }

  getHeaderString(int num) {
    String headerString = "";
    String char;
    int mod;
    while (true) {
      mod = (num % 26) + 65;
      num = (num ~/ 26);
      char = String.fromCharCode(mod);
      headerString = char + headerString;
      if (num > 0)
        num--;
      else if (num == 0) break;
    }
    return headerString;
  }
}
