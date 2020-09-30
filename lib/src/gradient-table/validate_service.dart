import 'dart:html';

///Injectable service to validate input
class ValidateService {
  ///validates input column count
  bool validateCountInput(columnCount) {
    if (columnCount == null || columnCount == '') {
      window.alert('Please, enter a value!');
      return false;
    }
    var count = int.tryParse(columnCount);
    if (count == null) {
      window.alert('The number must be an integer!');
      return false;
    } else if (count < 2 || count > 100) {
      window.alert('The number must be between 2 and 100!');
      return false;
    }
    return true;
  }
}
