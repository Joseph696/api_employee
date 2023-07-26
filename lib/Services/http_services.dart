import 'package:api_employee/Model/employee_model.dart';
import 'package:http/http.dart' as http;

class httpServices {
  static Future fetchemployeeData({String? query}) async {
    var responce = await http
        .get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
    if (responce.statusCode == 200) {
    
      var data = responce.body;
      if (query != null) {}
      return employeeFromJson(data);
    } else {
      Exception();
    }
  }
}
