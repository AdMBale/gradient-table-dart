///Injectable service, contains all the functions the gradient table needs.
class GradientService {
  ///Gets the table cell background color according to the coordinates and the column count.
  setGradientColor(xCoord, yCoord, count) {
    var colorSegment = this.getColorSegment(xCoord, yCoord, count).toString();
    if (xCoord == 0 && yCoord == 0) {
      return 'rgb(255, 255, 255)';
    } else if (xCoord == (count - 1) && yCoord == (count - 1)) {
      return 'rgb(255, 0, 0)';
    } else {
      return 'rgb(255,' + colorSegment + ',' + colorSegment + ')';
    }
  }

  ///Calculates the color segment of the rgb by the coordinates and column count.
  getColorSegment(xCoord, yCoord, count) {
    var cellValue = (xCoord + yCoord) / 2;
    return 255 - (255 * (cellValue / count));
  }

  ///Calculates the proper header string for the table column by [num] index.
  getHeaderString(num) {
    var headerString = '';
    var char;
    var mod;
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
