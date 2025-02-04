import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Carregando...',
              style: TextStyle(
                  fontSize: 15,
                  color:
                      Theme.of(context).primaryTextTheme.headlineMedium?.color),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
