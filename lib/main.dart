import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 横画面設定のためのインポート
import 'start_page.dart'; // ここを修正

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutterバインディングの初期化
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight, // 横画面（右）
    DeviceOrientation.landscapeLeft,  // 横画面（左）
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '激動の令和'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Timer to change visibility
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecondPage()),
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 1), // 追加: 上部のスペース
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 250,
              ),
              const Spacer(flex: 1), // 追加: 下部のスペース
              const SizedBox(height: 20), // 画像とテキストの間にスペースを追加
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0, // 点滅効果
                duration: const Duration(milliseconds: 600),
                child: const Text(
                  'タップしてスタート',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(flex: 1), // 追加: 下部のスペース
            ],
          ),
        ),
      ),
    );
  }
}
