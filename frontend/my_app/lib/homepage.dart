import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildCupertinoHomePage() : _buildMaterialHomePage();
  }

  Widget _buildCupertinoHomePage() {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 17, 3, 54),
      child: _buildCommonContent(isIOS: true),
    );
  }

  Widget _buildMaterialHomePage() {
    return Scaffold(
      body: _buildCommonContent(isIOS: false),
      backgroundColor: const Color.fromARGB(255, 17, 3, 54),
    );
  }

  Widget _buildCommonContent({required bool isIOS}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMainCard(),
            SizedBox(height: 20),
            _buildTokensTabs(),
            Expanded(child: _buildTokensList()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, const Color.fromARGB(255, 18, 104, 190)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildMainBalance(),
            SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello, Jade',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/profile_image.jpg'),
        ),
      ],
    );
  }

  Widget _buildMainBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Main Balance • in USD',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              '\$789,67,00',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton('Send', Iconsax.send_1),
        _buildActionButton('Receive', Iconsax.receive_square),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTokensTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildTab('Tokens', isSelected: true),
            SizedBox(width: 16),
            _buildTab('Flash USDT', isSelected: false),
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String label, {required bool isSelected}) {
    return Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.white60,
        fontSize: 18,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildTokensList() {
    final tokens = [
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('abbdbbdhuwiqwjiq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('uquiqqkkieyuchiq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('isjhcgcbicbnjhcn', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('cjsjnmcxkzkmxngq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('abbdbbdhuwiqwjiq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('uquiqqkkieyuchiq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('isjhcgcbicbnjhcn', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('cjsjnmcxkzkmxngq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('abbdbbdhuwiqwjiq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('uquiqqkkieyuchiq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('isjhcgcbicbnjhcn', '9.80 FUSDT', '\$789,67,00', 24.90),
      ('cjsjnmcxkzkmxngq', '9.80 FUSDT', '\$789,67,00', -340.90),
      ('xnbwhbnwuhujqioq', '9.80 FUSDT', '\$789,67,00', 44890.45),
      ('oqodijdinwnoicja', '9.80 FUSDT', '\$789,67,00', 24.90),
    ];

    return ListView.separated(
      itemCount: tokens.length,
      separatorBuilder: (context, index) => Divider(color: Colors.white24),
      itemBuilder: (context, index) {
        final token = tokens[index];
        return ListTile(
          leading: CircleAvatar(
            // backgroundImage: AssetImage(token.$4),
          ),
          title: Text(token.$1, style: TextStyle(color: Colors.white)),
          subtitle: Text(token.$2, style: TextStyle(color: Colors.white70)),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(token.$3, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}