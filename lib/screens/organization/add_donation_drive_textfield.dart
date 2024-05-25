import 'package:flutter/material.dart';

class DonationDriveInputField extends StatefulWidget {
  final Function callback;
  final String label;
  const DonationDriveInputField({super.key, required this.label ,required this.callback});

  @override
  State<DonationDriveInputField> createState() => _DonationDriveInputFieldState();
}

class _DonationDriveInputFieldState extends State<DonationDriveInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                capitalize(widget.label),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              ),
              const Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              ),
            ],
          ),
        ),
        TextFormField(
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter ${widget.label}!";
            }
            return null;
          },
          controller: _controller,
          onChanged: (value) {
            widget.callback(_controller.text);
          },
          decoration: InputDecoration(
            hintText: "Enter donation drive ${widget.label}",
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}