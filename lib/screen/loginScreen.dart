import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proviers/loginProvier.dart';
import 'package:testapp/screen/homescreen.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key, });
  var _formkey = GlobalKey<FormState>();
  var namectr = TextEditingController(text: "rahul");
  var passctr = TextEditingController(text: "123456789");
  @override
  Widget build(BuildContext context) {
  final loginProvier = Provider.of<Loginprovier>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(controller: namectr,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "enter a text";
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(controller: passctr,
                           validator: (value) {
                if (value!.isEmpty || value == null) {
                  return "enter a text";
                }else if(value.length<6){
return "passor shoul be more than 6 igits";
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
             ElevatedButton(
                onPressed: () async{
                  if (_formkey.currentState!.validate()) {
                   await loginProvier.login(namectr.text, passctr.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loginProvier.message!)));
                    print(loginProvier.token);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Homescreen();
                    },));
                  }
                },
                child: loginProvier.isloading  ? CircularProgressIndicator(strokeWidth: 2,color: Colors.orange,):Text("Login"))
          ],
        ),
      ),
    );
  }
}
