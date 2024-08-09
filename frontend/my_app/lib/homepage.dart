import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildCupertinoHomePage() : _buildMaterialHomePage();
  }

  Widget _buildCupertinoHomePage() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home',style: TextStyle(color: Colors.white)),
      //  backgroundColor: Col,
           backgroundColor: Color.fromARGB(255, 28, 5, 92),
       
       //  backgroundColor: Color.fromARGB(255, 17, 3, 54),
      ),
       backgroundColor: Color.fromARGB(255, 17, 3, 54),
      child: _buildCommonContent(isIOS: true),
    );
  }

  Widget _buildMaterialHomePage() {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Color.fromARGB(255, 28, 5, 92),
        title: Text('Home',style: TextStyle(color: Colors.white)),

      ),
      body: _buildCommonContent(isIOS: false),
      backgroundColor: Color.fromARGB(255, 17, 3, 54),
    );
  }

  Widget _buildCommonContent({required bool isIOS}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(width: 400,
            child: Card(
              elevation: 20,
              shadowColor: Colors.black,
            
              
             // color: Colors.grey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
               gradient: LinearGradient(
               colors: [Color.fromRGBO(255, 225, 133, 1),
               
                Colors.orange],
              begin: Alignment.bottomLeft,
               end: Alignment.topRight,
          ),
        ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('flashUSDT',style: TextStyle(color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                      ),),
                      Center(
                        child: Text(
                          "\$ 2000",
                          style: TextStyle(
                                color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Address',
                        overflow: TextOverflow.ellipsis,
                        
                        style: TextStyle(color: Colors.white,
                        fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Transaction History",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,builder){
                return Divider(
                  indent: 20,
                  endIndent: 30,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  
                  textColor: Colors.white,
                  
                  title: Text("Transaction type"),
                  subtitle: Text("Address"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Transaction time'),
                      Text(
                        '400',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
