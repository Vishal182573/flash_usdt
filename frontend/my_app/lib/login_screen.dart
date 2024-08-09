import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/provider/authprovider.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<authprovider>(context, listen: false).login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildCupertinoLoginScreen(context) : _buildMaterialLoginScreen(context);
  }

  Widget _buildCupertinoLoginScreen(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoTextFormFieldRow(
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  Provider.of<authprovider>(context, listen: false).updateEmail(value!);
                },
              ),
              SizedBox(height: 16),
              CupertinoTextFormFieldRow(
                placeholder: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  Provider.of<authprovider>(context, listen: false).updatePassword(value!);
                },
              ),
              SizedBox(height: 32),
              Consumer<authprovider>(
                builder: (context, authprovider, child) {
                  return CupertinoButton.filled(
                    onPressed: authprovider.isLoading ? null : () => _login(context),
                    child: authprovider.isLoading ? CupertinoActivityIndicator() : Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialLoginScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  Provider.of<authprovider>(context, listen: false).updateEmail(value!);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  Provider.of<authprovider>(context, listen: false).updatePassword(value!);
                },
              ),
              SizedBox(height: 32),
              Consumer<authprovider>(
                builder: (context, authprovider, child) {
                  return ElevatedButton(
                    onPressed: authprovider.isLoading ? null : () => _login(context),
                    child: authprovider.isLoading ? CircularProgressIndicator() : Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
