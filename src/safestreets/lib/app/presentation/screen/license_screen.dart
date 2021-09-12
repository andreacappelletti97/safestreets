import 'package:flutter/material.dart';
import 'package:safestreets/app/presentation/widgets/text_input_field.dart';

class LicenseScreen extends StatefulWidget {
  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}
class _LicenseScreenState extends State<LicenseScreen> {

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve License Plate Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextInputField(
            label: 'Insert license plate code',
            controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, myController.text);
        },
       
        child: Icon(Icons.search),
      ),
    );
  }
}
