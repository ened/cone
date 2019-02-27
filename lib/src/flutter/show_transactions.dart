import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path/path.dart' as p;

class ShowTransactions extends StatefulWidget {
  ShowTransactionsState createState() => ShowTransactionsState();
}

class ShowTransactionsState extends State<ShowTransactions> {
  String contents;

  void initState() {
    super.initState();
    TransactionStorage.readTransactions().then((result) {
      setState(() {
        contents = result;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: SingleChildScrollView(
          child: Text(contents ?? ''),
        ),
      ),
    );
  }
}

class TransactionStorage {
  static Future<String> readTransactions() async {
    final directory = '/storage/emulated/0/Documents/cone/';
    final file = File(p.join(directory, '.cone.ledger.txt'));
    return file.readAsString();
  }
}
