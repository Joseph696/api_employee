import 'package:api_employee/Services/http_services.dart';
import 'package:get/get.dart';

class empControl extends GetxController {
  var isLoading = true.obs;
  var EmployeeList = [].obs;
  @override
  void onInit() {
    fetchempData();
   
  }

  void fetchempData() async {
    try {
      isLoading(true);
      var empdata = await httpServices.fetchemployeeData();
      if (empdata != null) {
        EmployeeList.value = empdata;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  
}
