import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterCardScreen extends StatefulWidget {
  @override
  _CenterCardScreenState createState() => _CenterCardScreenState();
}

class _CenterCardScreenState extends State<CenterCardScreen> {
  String? _selectedValue = 'Mint'; // Initial dropdown value
  final List<String> _options = ['Mint', 'Burn'];
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            backgroundColor: const Color.fromARGB(255, 17, 3, 54),
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Mint & Burn', style: TextStyle(color: Colors.white)),
            ),
            child: _buildCenterCard(context),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Mint & Burn', style: TextStyle(color: Colors.white)),
              backgroundColor: const Color.fromARGB(255, 41, 2, 90),
              centerTitle: true,
            ),
            backgroundColor: const Color.fromARGB(255, 17, 3, 54),
            body: _buildCenterCard(context),
          );
  }

  Widget _buildCenterCard(BuildContext context) {
    return Center(
      child: Card(
        color: const Color.fromARGB(255, 4, 10, 94),
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
              Platform.isIOS
                  ? CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: _options.indexOf(_selectedValue!),
                      ),
                      itemExtent: 32,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _selectedValue = _options[index];
                        });
                      },
                      children: _options.map<Widget>((String value) {
                        return Center(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    )
                  : Container(
                      width: double.infinity, // Set the width to fill its parent
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white, // Background color for the dropdown
                      ),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        items: _options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black), // Text color
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue!;
                          });
                        },
                        isExpanded: true, // Make dropdown expand to the container width
                        underline: SizedBox(), // Remove the default underline
                      ),
                    ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Address here....",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter Amount here....",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? CupertinoButton.filled(
                      onPressed: () {
                        // Handle send action
                      },
                      child: const Text('Send'),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 10,
                        shadowColor: Colors.black,
                      ),
                      onPressed: () {
                        // Handle send action
                      },
                      child: const Text('Send', style: TextStyle(color: Colors.white)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
