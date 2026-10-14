import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static const _themeModeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.light;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final preferences = await SharedPreferences.getInstance();
    final savedMode = preferences.getString(_themeModeKey);

    if (!mounted) return;
    setState(() {
      _themeMode = savedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
      _isLoading = false;
    });
  }

  Future<void> _setDarkMode(bool enabled) async {
    final newMode = enabled ? ThemeMode.dark : ThemeMode.light;
    setState(() => _themeMode = newMode);

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_themeModeKey, enabled ? 'dark' : 'light');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Lab',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: _isLoading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : HomePage(
              isDarkMode: _themeMode == ThemeMode.dark,
              onDarkModeChanged: _setDarkMode,
            ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    required this.isDarkMode,
    required this.onDarkModeChanged,
    super.key,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Lab')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('Dark mode'),
              value: isDarkMode,
              onChanged: onDarkModeChanged,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const Text('Press'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 72),
            const SizedBox(height: 12),
            const Text('Profile'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ย้อนกลับ'),
            ),
          ],
        ),
      ),
    );
  }
}
