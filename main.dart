import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first_project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF6366F1),
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6366F1),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

// 🌟 Main Screen with Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(onNavigate: _goToPage),
      AboutPage(onNavigate: _goToPage),
      const ContactPage(),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _goToPage(index),
        selectedItemColor: const Color(0xFF6366F1),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_outlined),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// 🏠 Home Page
class HomePage extends StatelessWidget {
  final Function(int) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF00D4FF),
                      Color(0xFF8B5CF6),
                      Color(0xFFEC4899),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Icon(
                Icons.home_outlined,
                size: 50,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 20),
              const Text(
                'This is the Home Page',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome to our beautiful navigation app!\nExplore different sections using the buttons below.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => onNavigate(1), // يروح لصفحة About
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Go to About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ℹ️ About Page
class AboutPage extends StatelessWidget {
  final Function(int) onNavigate;

  const AboutPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6366F1),
                      Color(0xFF8B5CF6),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.info_outline,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Icon(
                Icons.mail_outline,
                size: 50,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 20),
              const Text(
                'This is the About Page',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Learn more about our app and its amazing features!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => onNavigate(2), // يروح لصفحة Contact
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Go to Contact',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ☎️ Contact Page
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF10B981),
                      Color(0xFF6366F1),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'This is the Contact Page',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Get in touch with us for any inquiries or support.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email_outlined, color: Color(0xFF6366F1)),
                  SizedBox(width: 8),
                  Text('contact@example.com'),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Color(0xFF6366F1)),
                  SizedBox(width: 8),
                  Text('+1 234 567 8900'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
