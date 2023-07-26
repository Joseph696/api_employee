import 'package:api_employee/Controller/http_controller.dart';
import 'package:api_employee/Model/employee_model.dart';
import 'package:flutter/material.dart';

class EmplistTile extends StatelessWidget {
  final Employee employee;
  EmplistTile(this.employee);

  @override
  Widget build(BuildContext context) {
    

    return Card(
      child: ListTile(
        title: Text(employee.name),
        subtitle: Text(employee.email),
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            color: Colors.yellow
          ),
          child: Image(image: NetworkImage('${employee.profileImage}'),fit: BoxFit.cover,),

        ),
      ),
    );
  }
}
