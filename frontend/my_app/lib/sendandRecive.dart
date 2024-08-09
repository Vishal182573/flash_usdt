import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
           backgroundColor: Color.fromARGB(255, 17, 3, 54),
            navigationBar: CupertinoNavigationBar(
              middle: Text('Send Message',style: TextStyle(color: Colors.white)),
            //  backgroundColor: Colors.,
            ),
            child: _buildCenterCard(context),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Send Message',style: TextStyle(color: Colors.white),),
              backgroundColor: Color.fromARGB(255, 41, 2, 90),
            ),
             backgroundColor: Color.fromARGB(255, 17, 3, 54),
            body: _buildCenterCard(context),
          );
  }

  Widget _buildCenterCard(BuildContext context) {
    return Center(
      child: Card(
        color: const Color.fromARGB(255, 5, 42, 72),

        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
            
                decoration: InputDecoration(
                
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.white
                  ,
                  hintText: "Enter Address here........",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Platform.isIOS
                  ? CupertinoButton.filled(
                    
                      onPressed: () {
                        // Handle send action
                      },
                      child: Text('Send'),
                    )
                  : ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                    elevation: 10,shadowColor: Colors.black),
                      onPressed: () {
                        // Handle send action
                      },
                      child: Text('Send',style: TextStyle(color: Colors.white),),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CenterCardScreen(),
  ));
}
