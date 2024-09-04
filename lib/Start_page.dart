import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ボタンを中央に配置
          children: <Widget>[
            const Text(
              'ゲームをはじめる',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40), // テキストとボタンの間にスペースを追加
            ElevatedButton(
              onPressed: () {
                // 「はじめから」ボタンが押されたときの処理
                // 実際の処理はここに追加する
              },
              child: const Text('はじめから'),
            ),
            const SizedBox(height: 20), // ボタン間のスペース
            ElevatedButton(
              onPressed: () {
                // 「続ける」ボタンが押されたときの処理
                // 実際の処理はここに追加する
              },
              child: const Text('続ける'),
            ),
            const SizedBox(height: 20), // ボタン間のスペース
            ElevatedButton(
              onPressed: () {
                // 「設定」ボタンが押されたときの処理
                // 実際の処理はここに追加する
              },
              child: const Text('設定'),
            ),
          ],
        ),
      ),
    );
  }
}
