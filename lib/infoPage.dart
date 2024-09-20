import 'package:flutter/material.dart';

class Infopage extends StatefulWidget {



  @override
  _InfopageState createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {
  int _currentIndex = 1;

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/info');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? information = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is the Info Page",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              information ?? "No information received",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Hero(tag: 'hero-image',
                child: Image.asset(
                    'assets/icon/Paris.jpg',
                    width: 300,
                    height: 300,
                    ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Paris is a lovely city",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
