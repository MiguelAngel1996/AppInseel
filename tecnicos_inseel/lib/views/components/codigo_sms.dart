import 'package:flutter/material.dart';

class CodigoSms extends StatelessWidget {

  final Function(String) onVerifyCode;
  CodigoSms({super.key, required this.onVerifyCode});

  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter Verification Code',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _codeController,
            decoration: InputDecoration(labelText: 'Verification Code'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              onVerifyCode(_codeController.text);
            },
            child: Text('Verify Code'),
          ),
        ],
      ),
    );
  }
}