
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:RegistrationPage(),));
}
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Registrationbody() ,
      appBar: AppBar(
        title: Text("Registration form"),
      ),
    );
  }
}
class Registrationbody extends StatefulWidget {

  const Registrationbody({Key? key}) : super(key: key);

  @override
  _RegistrationbodyState createState() => _RegistrationbodyState();

}

class _RegistrationbodyState extends State<Registrationbody> {
  var courses=["java","SQl","DD"];
  int gender = 0;
  var selectCourses;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [Text ("Resgistration"),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "mobile",
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "email",
          ),
        ),
        TextFormField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: "address",
          ),
        ),


        Text("courses"),
        DropdownButtonFormField(

          items:courses.map(( String course) {

            return DropdownMenuItem(
                value: course,
                child: Text(course));
          }).toList(),onChanged: (newValue){
          setState(()  => selectCourses= newValue);

        },
          value:selectCourses,

        ),
        Row(children: const <Widget>[

          Text("   Gender :   ",
              style: TextStyle(fontSize: 15.0)),
          SizedBox(height: 40.0),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                child: ListTile(
                  title: Text(
                      'Male'
                  ),
                  leading: Radio(
                    value: 0,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListTile(
                  title: Text(
                      'Female'
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = 1;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment:MainAxisAlignment. center, children: [
          const SizedBox(height: 50.0,),
          ElevatedButton(onPressed: (){
            String name =nameController.value.toString();
            String email = emailController.value.toString();
            String mobile = mobileController.value.toString();
            String address = addressController.value.toString();
            String gen = gender == 0? 'Male': 'Female';
          }, child: const Text("Submit"))
        ],)

      ],
      ),
    );
  }
}


