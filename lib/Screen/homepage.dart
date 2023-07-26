import 'package:api_employee/Controller/http_controller.dart';
import 'package:api_employee/Model/employee_model.dart';
import 'package:api_employee/Searchuser/search_user.dart';
import 'package:api_employee/Widget/widget_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  final empControl EmployeeControl = Get.put(empControl());
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: Icon(Icons.search))
            ],
            title: Text("Employee List"),
          ),
          Obx(() {
            if (EmployeeControl.isLoading.value) {
              return SliverFillRemaining(
                child: CircularProgressIndicator(),
              );
            } else {
              return SliverList.builder(
                itemCount: EmployeeControl.EmployeeList.length,
                itemBuilder: (context, index) {
                  return EmplistTile(EmployeeControl.EmployeeList[index]);
                },
              );
            }
          })
        ],
      ),
    );
  }
}
