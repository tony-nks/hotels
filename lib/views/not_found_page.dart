import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);
  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Ой, такой страницы не существует'),),
    );
  }
}

class NotFoundContent extends StatelessWidget {
  const NotFoundContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Контент временно не доступен'),),
    );
  }
}

class LoadingContent extends StatelessWidget {
  const LoadingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}

