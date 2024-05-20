import 'package:flutter/material.dart';
    
class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State'),
      ),
      body: Container(),
    );
  }
}