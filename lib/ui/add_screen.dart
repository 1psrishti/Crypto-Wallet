import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];

  String dropdownValue = "bitcoin";
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            dropdownColor: Colors.deepPurple[600],
            iconEnabledColor: Colors.white,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Enter Coin Amount",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.purpleAccent,
            ),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(dropdownValue, _amountController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
