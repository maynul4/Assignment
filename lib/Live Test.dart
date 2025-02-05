import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveTest extends StatefulWidget{
   LiveTest({super.key});

  @override
  State<LiveTest> createState() => _LiveTestState();
}

class _LiveTestState extends State<LiveTest> {

  List <Map<String, dynamic>> emloyeeInfo = [];

  TextEditingController _NameController = TextEditingController();

  TextEditingController _ageController = TextEditingController();

  TextEditingController _salaryContrller = TextEditingController();

  addInfo(){
    setState(() {
      emloyeeInfo.add(
        {
          'Name':_NameController.text,
          'Age': _ageController.text,
          'Salary': _salaryContrller.text
        }
      );
    });
    _NameController.clear();
    _ageController.clear();
    _salaryContrller.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _NameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Name'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                hintText: 'Age'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _salaryContrller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Salary',
                hintText: 'Salary'

              ),
            ),
          ),

          ElevatedButton(onPressed: (){addInfo();}, child: Text('Add Employee'))

        ],
      ),
    );
  }
}