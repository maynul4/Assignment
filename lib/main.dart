

import 'package:assignment/Live%20Test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//Run app section

void main (){
  runApp(ContactList() );

}

//Material App section

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiveTest(),
      debugShowCheckedModeBanner: false,
      title: 'Contact List',);
  }
}

//Activity section

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

final _formKey = GlobalKey<FormState>();

class _AssignmentState extends State<Assignment> {

// List for store data

    List <Map> _contactInfo  = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();


  addinfo(){
    setState(() {
      _contactInfo.add(
        {
          'Name':_nameController.text,
          'Number':_numberController.text
        },
      );
      _nameController.clear();
      _numberController.clear();


    });
  }

  removeInfo(index){
   setState(() {
     _contactInfo.removeAt(index);
   });
  }

 counter(){
    setState(() {
      _numberController.text.length;
    });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 30),),
        centerTitle: true ,
        backgroundColor: Color(0xd8276075),
        toolbarHeight: 80,
      ),

      body: Column(
        children: [

          Form(
            key: _formKey,
            child: Column(
              children: [
                // Name Field
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value!.isEmpty){
                        return 'Name can\'t empty';
                      }
                      return null;
                    },
                    controller: _nameController,
                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Name',
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                //Number Field
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value!.isEmpty){
                        return 'Number can\'t empty';
                      }
                      return null;
                    },
                    controller: _numberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly ,
                      LengthLimitingTextInputFormatter(14)
                    ],
                    decoration: InputDecoration(
                      hintText: 'Number',
                      labelText: 'Number',
                      border: OutlineInputBorder(),

                    ),
                  ),
                ),
              ],
            )
          ),
          //add Button Section
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  return addinfo();
                }
              },
              child: Text('Add',style: TextStyle(color:Colors.white, fontSize: 25, fontWeight: FontWeight.w400),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xd8276075),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              )
            ),
          ),

          // Contact list section

          SizedBox(
            height: 20,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _contactInfo.length,
              itemBuilder: (BuildContext  context, int index){
                return Column(
                  children: [
                    GestureDetector(

                      // Show popup section

                      onLongPress: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure for delete?'),
                              actions: [
                                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.no_sim_outlined,color: Colors.blue,)),
                                IconButton(onPressed: (){
                                  removeInfo(index);
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.delete, color: Colors.blue,)),
                              ],
                            );
                          }
                          );
                      },

                      // Show popup section

                      // Contact List section
                      child: Card(
                        color: Colors.grey.shade300,
                          child: ListTile(
                          leading: Icon(Icons.person,size: 40,),
                          title: Text(_contactInfo[index]['Name'],style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: Text(_contactInfo[index]['Number'], style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 15)),
                          trailing: Icon(Icons.call,size: 30,color: Colors.blue,),
                        )
                      ),
                    ),

                    // Divider

                    Divider(height: 2,)

                  ],
                );
              },
            ),
          ),

          Divider(height: 2, )

        ],
      ),

    );
  }
}


//Alert Dialouge




