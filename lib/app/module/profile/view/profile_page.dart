import 'package:e_commerce/app/module/profile/widgets/ExpansionItemListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:status_view/status_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isAccountExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              _profilePic(),
              const SizedBox(height: 10),
              const Text(
                'John Smith',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'info@johnsmith.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ExpansionItemListWidget(
                title: "About",
                icon: Icons.person_outlined,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text('Passwords'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Passwords tap
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notification'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Notification tap
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite_border),
                  title: const Text('Wishlist (00)'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle Wishlist tap
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _myAccount() => ExpansionPanelList(
        // elevation: 1,
        expandedHeaderPadding: const EdgeInsets.all(0),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isAccountExpanded = !_isAccountExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Account'),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[],
              ),
            ),
            isExpanded: _isAccountExpanded,
          ),
        ],
      );

  _profilePic() => StatusView(
        radius: 60,
        spacing: 5,
        strokeWidth: 2,
        indexOfSeenStatus: 20,
        numberOfStatus: 50,
        padding: 4,
        centerImageUrl: "https://picsum.photos/200/300",
        seenColor: Colors.grey,
        unSeenColor: Colors.red,
      );
}
