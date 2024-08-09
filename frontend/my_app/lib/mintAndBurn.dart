// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CenterCardScreen extends StatefulWidget {
//   @override
//   _CenterCardScreenState createState() => _CenterCardScreenState();
// }

// class _CenterCardScreenState extends State<CenterCardScreen> {
//   String? _selectedValue = 'Mint'; // Initial dropdown value
//   final List<String> _options = ['Mint', 'Burn'];
  
//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIOS
//         ? CupertinoPageScaffold(
//             backgroundColor: const Color.fromARGB(255, 17, 3, 54),
//             navigationBar: const CupertinoNavigationBar(
//               middle: Text('Mint & Burn', style: TextStyle(color: Colors.white)),
//             ),
//             child: _buildCenterCard(context),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               title: const Text('Mint & Burn', style: TextStyle(color: Colors.white)),
//               backgroundColor: const Color.fromARGB(255, 41, 2, 90),
//               centerTitle: true,
//             ),
//             backgroundColor: const Color.fromARGB(255, 17, 3, 54),
//             body: _buildCenterCard(context),
//           );
//   }

//   Widget _buildCenterCard(BuildContext context) {
//     return Center(
//       child: Card(
//         color: const Color.fromARGB(255, 4, 10, 94),
//         elevation: 10,
//         shadowColor: Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Platform.isIOS
//                   ? CupertinoPicker(
//                       scrollController: FixedExtentScrollController(
//                         initialItem: _options.indexOf(_selectedValue!),
//                       ),
//                       itemExtent: 32,
//                       onSelectedItemChanged: (int index) {
//                         setState(() {
//                           _selectedValue = _options[index];
//                         });
//                       },
//                       children: _options.map<Widget>((String value) {
//                         return Center(
//                           child: Text(
//                             value,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         );
//                       }).toList(),
//                     )
//                   : Container(
//                       width: double.infinity, // Set the width to fill its parent
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white, // Background color for the dropdown
//                       ),
//                       child: DropdownButton<String>(
//                         value: _selectedValue,
//                         items: _options.map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: TextStyle(color: Colors.black), // Text color
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _selectedValue = newValue!;
//                           });
//                         },
//                         isExpanded: true, // Make dropdown expand to the container width
//                         underline: SizedBox(), // Remove the default underline
//                       ),
//                     ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Enter Address here....",
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: const OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Enter Amount here....",
//                   hintStyle: const TextStyle(color: Colors.grey),
//                   border: const OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Platform.isIOS
//                   ? CupertinoButton.filled(
//                       onPressed: () {
//                         // Handle send action
//                       },
//                       child: const Text('Send'),
//                     )
//                   : ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         elevation: 10,
//                         shadowColor: Colors.black,
//                       ),
//                       onPressed: () {
//                         // Handle send action
//                       },
//                       child: const Text('Send', style: TextStyle(color: Colors.white)),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwapScreen extends StatefulWidget {
  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  String fromToken = 'BNB';
  String toToken = 'ETH';
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            backgroundColor: const Color.fromARGB(255, 17, 3, 54),
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Swap', style: TextStyle(color: Colors.white)),
              backgroundColor: Color(0xFF1A237E),
            ),
            child: _buildContent(),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Mint & Burn', style: TextStyle(color: Colors.white)),
              backgroundColor: const Color(0xFF1A237E),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // Handle settings action
                  },
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 17, 3, 54),
            body: _buildContent(),
          );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mint & Burn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            _buildTokenCard('From', fromToken, '38.50', '\$14,550.90', '48.9308'),
            SizedBox(height: 16),
            Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.swap_vert, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            _buildTokenCard('To', toToken, '38.50', '\$14,550.90', '48.9308'),
            SizedBox(height: 24),
            Center(
              child: Text(
                '1BNB=0.0145ETH',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Spacer(),
            _buildSwapButton(),
            SizedBox(height: 16),
            _buildViewAnalyticsButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTokenCard(String label, String token, String amount, String usdValue, String balance) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF303F9F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: token == 'BNB' ? Colors.amber : Colors.blue,
                    child: Text(token[0], style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 8),
                  Text(token, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
              Text('Bal: $balance', style: TextStyle(color: Colors.white70)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text(usdValue, style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwapButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          // Handle swap action
        },
        child: Text('Swap', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  Widget _buildViewAnalyticsButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          // Handle view analytics action
        },
        child: Text('View Analytics', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}