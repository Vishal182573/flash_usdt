// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:my_app/provider/authprovider.dart';
// import 'package:provider/provider.dart';


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   void _login(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Provider.of<authprovider>(context, listen: false).login();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS ? _buildCupertinoLoginScreen(context) : _buildMaterialLoginScreen(context);
//   }

//   Widget _buildCupertinoLoginScreen(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Login'),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CupertinoTextFormFieldRow(
//                 placeholder: 'Email',
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updateEmail(value!);
//                 },
//               ),
//               const SizedBox(height: 16),
//               CupertinoTextFormFieldRow(
//                 placeholder: 'Password',
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updatePassword(value!);
//                 },
//               ),
//               const SizedBox(height: 32),
//               Consumer<authprovider>(
//                 builder: (context, authprovider, child) {
//                   return CupertinoButton.filled(
//                     onPressed: authprovider.isLoading ? null : () => _login(context),
//                     child: authprovider.isLoading ? const CupertinoActivityIndicator() : const Text('Login'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMaterialLoginScreen(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 17, 3, 54),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                   labelStyle: TextStyle(color: Colors.white),
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 3, 156, 221),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updateEmail(value!);
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   labelStyle: TextStyle(color: Colors.white),
//                   border: OutlineInputBorder(),
                
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 3, 156, 221),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updatePassword(value!);
//                 },
//               ),
//               const SizedBox(height: 32),
//               Consumer<authprovider>(
//                 builder: (context, authprovider, child) {
//                   return ElevatedButton(
//                     onPressed: authprovider.isLoading ? null : () => _login(context),
//                     child: authprovider.isLoading ? const CircularProgressIndicator() : const Text('Login'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:my_app/provider/authprovider.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();

//   void _login(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Provider.of<authprovider>(context, listen: false).login();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS ? _buildCupertinoLoginScreen(context) : _buildMaterialLoginScreen(context);
//   }

//   Widget _buildCupertinoLoginScreen(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Login'),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CupertinoTextField(
//                 placeholder: 'Email',
//                 keyboardType: TextInputType.emailAddress,
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 12, 182, 212),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 placeholderStyle: TextStyle(color: Colors.grey),
//                 textAlign: TextAlign.start,
//                 onChanged: (value) {
//                   Provider.of<authprovider>(context, listen: false).updateEmail(value);
//                 },
//               ),
//               const SizedBox(height: 16),
//               CupertinoTextField(
//                 placeholder: 'Password',
//                 obscureText: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 12, 182, 212),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 placeholderStyle: TextStyle(color: Colors.grey),
//                 textAlign: TextAlign.start,
//                 onChanged: (value) {
//                   Provider.of<authprovider>(context, listen: false).updatePassword(value);
//                 },
//               ),
//               const SizedBox(height: 32),
//               Consumer<authprovider>(
//                 builder: (context, authprovider, child) {
//                   return CupertinoButton.filled(
//                     onPressed: authprovider.isLoading ? null : () => _login(context),
//                     child: authprovider.isLoading ? const CupertinoActivityIndicator() : const Text('Login'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMaterialLoginScreen(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 17, 3, 54),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Flash USDT', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),),
//               const SizedBox(height: 20),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(color: Colors.white),
//                   fillColor: Color.fromARGB(255, 12, 182, 212),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updateEmail(value!);
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   labelStyle: TextStyle(color: Colors.white),
//                   fillColor: Color.fromARGB(255, 12, 182, 212),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.blue),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   Provider.of<authprovider>(context, listen: false).updatePassword(value!);
//                 },
//               ),
//               const SizedBox(height: 32),
//               Consumer<authprovider>(
//                 builder: (context, authprovider, child) {
//                   return ElevatedButton(
//                     onPressed: authprovider.isLoading ? null : () => _login(context),
//                     child: authprovider.isLoading ? const CircularProgressIndicator() : const Text('Login'),
//                   );
//                 },
//               ),
//               const SizedBox(height: 60),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Don\'t have an account? ', style: TextStyle(color: Colors.white, fontSize: 16),),
//                   Text('Create Now', style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 110, 147, 211), fontSize: 16),)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 93, 1, 155), Color.fromARGB(255, 17, 3, 54)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Flash USDT',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CupertinoTextField(
                  placeholder: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  placeholderStyle: TextStyle(color: Colors.black),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    Provider.of<authprovider>(context, listen: false).updateEmail(value);
                  },
                ),
                const SizedBox(height: 16),
                CupertinoTextField(
                  placeholder: 'Password',
                  obscureText: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  placeholderStyle: TextStyle(color: Colors.black),
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    Provider.of<authprovider>(context, listen: false).updatePassword(value);
                  },
                ),
                const SizedBox(height: 32),
                Consumer<authprovider>(
                  builder: (context, authprovider, child) {
                    return CupertinoButton.filled(
                      onPressed: authprovider.isLoading ? null : () => _login(context),
                      child: authprovider.isLoading ? const CupertinoActivityIndicator() : const Text('Login'),
                    );
                  },
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text('Create Now', style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 110, 147, 211), fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMaterialLoginScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 93, 1, 155), Color.fromARGB(255, 17, 3, 54)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Flash USDT',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
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
                const SizedBox(height: 32),
                Consumer<authprovider>(
                  builder: (context, authprovider, child) {
                    return ElevatedButton(
                      onPressed: authprovider.isLoading ? null : () => _login(context),
                      child: authprovider.isLoading ? const CircularProgressIndicator() : const Text('Login'),
                    );
                  },
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text('Create Now', style: TextStyle(decoration: TextDecoration.underline, color: Color.fromARGB(255, 110, 147, 211), fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
