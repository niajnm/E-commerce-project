import 'package:e_commerce/app/module/home/view/home_page.dart';
import 'package:e_commerce/app/module/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _views = <Widget>[
    HomePage(),
    SearchView(),
    CartView(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _views[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 60, // Adjust height to avoid overflow
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildTabIcon(Icons.home, 0),
              buildTabIcon(Icons.shopping_cart, 2),
              const SizedBox(width: 40), // The dummy child for spacing
              buildTabIcon(Icons.person, 3),
              buildTabIcon(Icons.settings, 1),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          // <-- Splash color
        ),
        child: const Icon(Icons.search_rounded, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildTabIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.red[800] : Colors.grey,
      ),
      onPressed: () {
        _onItemTapped(index);
      },
    );
  }
}

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search View',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Cart View',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
