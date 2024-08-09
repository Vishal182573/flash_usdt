import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/bottomnavigationbar.dart';
import 'package:my_app/provider/authprovider.dart';
import 'package:my_app/provider/authprovider.dart';
import 'package:my_app/provider/authprovider.dart';
import 'package:provider/provider.dart';


class CreateAccountScreen extends StatefulWidget {
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

TextEditingController email=TextEditingController();
TextEditingController name=TextEditingController();
TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Create Account'),
            ),
            child: _buildForm(context),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Create Account'),
            ),
            body: _buildForm(context),
          );
  }

  Widget _buildForm(BuildContext context) {
    final Authprovider= Provider.of<authprovider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<authprovider>(
        builder: (context, registrationModel, child) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Platform.isIOS
                    ? CupertinoTextFormFieldRow(
                        placeholder: 'Name',
                        keyboardType: TextInputType.name,
                        controller: name,
                       // onChanged: registrationModel.setName,
                      )
                    : TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                       controller: name,
                       // onChanged: registrationModel.setName,
                      ),
                SizedBox(height: 16),
                Platform.isIOS
                    ? CupertinoTextFormFieldRow(
                        placeholder: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        //onChanged: registrationModel.setEmail,
                      )
                    : TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                       controller: email,
                       // onChanged: registrationModel.setEmail,
                      ),
                SizedBox(height: 16),
                Platform.isIOS
                    ? CupertinoTextFormFieldRow(
                        placeholder: 'Password',
                        obscureText: true,
                      controller: password,
                        //onChanged: registrationModel.setPassword,
                      )
                    : TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      controller: password,
                      //  onChanged: registrationModel.setPassword,
                      ),
                SizedBox(height: 32),
                Platform.isIOS
                    ? 
                    Authprovider.isLoading?CupertinoActivityIndicator() :
                    CupertinoButton.filled(
                        onPressed: ()async {
                        await  Authprovider.register(name.text, email.text, password.text).then((_) {
                          Get.to(()=>HomePage());
    //  Navigator.of(context).pop();
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
                        },
                        child: Text('Create Account'),
                      )
                    : 
                    Authprovider.isLoading?CircularProgressIndicator():
                    ElevatedButton(
                       onPressed: ()async {
                        await  Authprovider.register(name.text, email.text, password.text).then((_) {
                          
      //Navigator.of(context).pop();
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
                        },
                        child: Text('Create Account'),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
