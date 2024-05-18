import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final Function callback;
  final String text;
  const InputField({required this.callback, required this.text, super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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
        if (widget.text.toLowerCase() != 'address')
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              capitalize(widget.text),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        const SizedBox(height: 4),
        TextFormField(
          onSaved: (val) {
            // ignore: avoid_print
            print("Text value: ${val!}");
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your ${widget.text}";
            }
            return null;
          },
          controller: _controller,
          onChanged: (value) {
            widget.callback(_controller.text);
          },
          decoration: InputDecoration(
            hintText: "Enter your ${widget.text}",
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
      ],
    );
  }
}
