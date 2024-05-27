import 'package:dotted_border/dotted_border.dart';
import 'package:elbigay/models/donor_donation_model.dart';
import 'package:elbigay/providers/donation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _formKey = GlobalKey<FormState>();
  bool _food = false;
  bool _clothes = false;
  bool _cash = false;
  bool _necessities = false;
  bool _others = false;
  DateTime? _date;
  TimeOfDay? _time;
  DateTime? _finalDateTime;
  String? _stringFinalDateTime;
  String _weight = '';
  String _modeOfDelivery = 'Drop off';
  String _address = '';
  String _contactNumber = '';

  List<String> _itemType = [];
  List<bool> _selectedMode = [true, false];

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  bool get _isAnyChecked =>
      _food || _clothes || _cash || _necessities || _others;

  TimeOfDay _minTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _maxTime = TimeOfDay(hour: 20, minute: 0);

  bool _isTimeInRange(TimeOfDay? time) {
    final DateTime now = DateTime.now();
    final DateTime minDateTime =
        DateTime(now.year, now.month, now.day, _minTime.hour, _minTime.minute);
    final DateTime maxDateTime =
        DateTime(now.year, now.month, now.day, _maxTime.hour, _maxTime.minute);
    final DateTime selectedDateTime =
        DateTime(now.year, now.month, now.day, time!.hour, time.minute);
    return selectedDateTime.isAfter(minDateTime) &&
        selectedDateTime.isBefore(maxDateTime);
  }

  String formatTimeofDay(TimeOfDay? timeOfDay) {
    final String hour = timeOfDay!.hour.toString().padLeft(2, '0');
    final String minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Widget dropOff() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weight of the items to donate (kg)",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter weight";
            }
          },
          onChanged: (value) {
            _weight = value;
          },
          onSaved: (val) {
            print("Text value: ${val!}");
          },
          decoration: InputDecoration(
            hintText: "Enter weight",
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
        SizedBox(height: 25),
        Text(
          "Choose Date and Time",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: "Choose date",
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
                readOnly: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please pick a date";
                  }
                },
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100));
                  if (selectedDate != null) {
                    _date = selectedDate;
                    _dateController.text =
                        selectedDate.toString().split(" ")[0];
                  }
                },
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.timer),
                  hintText: "Choose time",
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
                readOnly: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please pick a time";
                  }
                },
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null && _isTimeInRange(selectedTime)) {
                    _time = selectedTime;
                    _timeController.text = formatTimeofDay(selectedTime);
                  }

                  if (!_isTimeInRange(selectedTime)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please select a time between 8:00 AM and 8:00 PM'),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget pickup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weight of the items to donate (kg)",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter weight";
            }
          },
          onChanged: (value) {
            _weight = value;
          },
          onSaved: (val) {
            print("Text value: ${val!}");
          },
          decoration: InputDecoration(
            hintText: "Enter weight",
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
        SizedBox(height: 25),
        Text(
          "Choose Date and Time",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: "Choose date",
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
                readOnly: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please pick a date";
                  }
                },
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100));
                  if (selectedDate != null) {
                    _date = selectedDate;
                    _dateController.text =
                        selectedDate.toString().split(" ")[0];
                  }
                },
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.timer),
                  hintText: "Choose time",
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
                readOnly: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please pick a time";
                  }
                },
                onTap: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null && _isTimeInRange(selectedTime)) {
                    _time = selectedTime;
                    _timeController.text = formatTimeofDay(selectedTime);
                  }

                  if (!_isTimeInRange(selectedTime)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please select a time between 8:00 AM and 8:00 PM'),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        Text(
          "Address",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Enter address",
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
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter an address";
            }
          },
          onChanged: (value) {
            setState(() {
              _address = value;
            });
          },
        ),
        SizedBox(height: 15),
        Text(
          "Contact Number",
          textAlign: TextAlign.left,
          style:
              TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1),
        ),
        SizedBox(height: 10),
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: "Enter contact number",
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
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your contact number";
            }
          },
          onChanged: (value) {
            setState(() {
              _contactNumber = value;
            });
          },
        ),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Donation Form",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 23),
                  child: Text(
                    "Choose items to donate",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold, height: 1),
                  ),
                ),
                SizedBox(height: 8),
                FormField<bool>(validator: (value) {
                  if (!_isAnyChecked) {
                    print("At least one checkbox must be selected");
                  }
                  return null;
                }, builder: (FormFieldState<bool> state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 24,
                        width: screenWidth,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: _food
                                    ? Colors.transparent
                                    : Color.fromRGBO(232, 232, 232, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 0.10000000149011612),
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: _food,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _food = value!;
                                  });
                                  state.validate();
                                },
                              ),
                            ),
                            SizedBox(width: 7),
                            Text("Food")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: screenWidth,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: _clothes
                                    ? Colors.transparent
                                    : Color.fromRGBO(232, 232, 232, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 0.10000000149011612),
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: _clothes,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _clothes = value!;
                                  });
                                  state.validate();
                                },
                              ),
                            ),
                            SizedBox(width: 7),
                            Text("Clothes")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: screenWidth,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: _cash
                                    ? Colors.transparent
                                    : Color.fromRGBO(232, 232, 232, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 0.10000000149011612),
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: _cash,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _cash = value!;
                                  });
                                  state.validate();
                                },
                              ),
                            ),
                            SizedBox(width: 7),
                            Text("Cash")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: screenWidth,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: _necessities
                                    ? Colors.transparent
                                    : Color.fromRGBO(232, 232, 232, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 0.10000000149011612),
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: _necessities,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _necessities = value!;
                                  });
                                  state.validate();
                                },
                              ),
                            ),
                            SizedBox(width: 7),
                            Text("Necessities")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: screenWidth,
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: _others
                                    ? Colors.transparent
                                    : Color.fromRGBO(232, 232, 232, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 18,
                              width: 18,
                              child: Checkbox(
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    width: 0.10000000149011612),
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: _others,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _others = value!;
                                  });
                                  state.validate();
                                },
                              ),
                            ),
                            SizedBox(width: 7),
                            Text("Others")
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 20),
                Align(
                  child: ToggleButtons(
                    isSelected: _selectedMode,
                    selectedColor: Colors.white,
                    color: Colors.grey,
                    fillColor: Theme.of(context).primaryColor,
                    splashColor: Theme.of(context).primaryColor,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                    borderRadius: BorderRadius.circular(20),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15),
                        child: Text('Drop off', style: TextStyle(fontSize: 13)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15),
                        child: Text('Pickup', style: TextStyle(fontSize: 13)),
                      ),
                    ],
                    onPressed: (int newIndex) {
                      setState(() {
                        for (int index = 0;
                            index < _selectedMode.length;
                            index++) {
                          if (index == newIndex) {
                            _selectedMode[index] = true;
                          } else {
                            _selectedMode[index] = false;
                          }
                        }

                        if (newIndex == 0) {
                          _modeOfDelivery = 'Drop off';
                        } else {
                          _modeOfDelivery = 'Pickup';
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 25),
                if (_modeOfDelivery == "Drop off") dropOff(),
                if (_modeOfDelivery == "Pickup") pickup(),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                    dashPattern: const [7, 3],
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.photo_library,
                                    color: Theme.of(context).primaryColor,
                                    size: screenWidth * 0.15),
                                Text("Take a photo or browse",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(14, 198, 178, 1),
                        Color.fromRGBO(37, 212, 147, 1)
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.39),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save;
                      }
                      if (!_isAnyChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Please select at least one checkbox.')),
                        );
                        return;
                      }
                      setState(() {
                        _finalDateTime = DateTime(_date!.year, _date!.month,
                            _date!.day, _time!.hour, _time!.minute);

                        DateFormat dateFormat = DateFormat("yyy-MM-dd HH:mm");
                        _stringFinalDateTime =
                            dateFormat.format(_finalDateTime!);
                        dateFormat.format(_finalDateTime!);

                        if (_food) {
                          if (!_itemType.contains("Food")) {
                            _itemType.add("Food");
                          }
                        } else {
                          if (_itemType.contains("Food")) {
                            _itemType.remove("Food");
                          }
                        }
                        if (_clothes) {
                          if (!_itemType.contains("Clothes")) {
                            _itemType.add("Clothes");
                          }
                        } else {
                          if (_itemType.contains("Clothes")) {
                            _itemType.remove("Clothes");
                          }
                        }

                        if (_cash) {
                          if (!_itemType.contains("Cash")) {
                            _itemType.add("Cash");
                          }
                        } else {
                          if (_itemType.contains("Cash")) {
                            _itemType.remove("Cash");
                          }
                        }

                        if (_necessities) {
                          if (!_itemType.contains("Necessities")) {
                            _itemType.add("Necessities");
                          }
                        } else {
                          if (_itemType.contains("Necessities")) {
                            _itemType.remove("Necessities");
                          }
                        }

                        if (_others) {
                          if (!_itemType.contains("Others")) {
                            _itemType.add("Others");
                          }
                        } else {
                          if (_itemType.contains("Others")) {
                            _itemType.remove("Others");
                          }
                        }

                        if (_modeOfDelivery == "Pickup") {
                          Donation donation = Donation(
                            userId: "2",
                            donorName: "Myndie Labiano",
                            orgId: "1",
                            itemType: _itemType,
                            status: "Pending",
                            address: _address,
                            contactNumber: _contactNumber,
                            modeOfDelivery: _modeOfDelivery,
                            weight: _weight,
                            dateTime: _stringFinalDateTime!,
                          );
                          context
                              .read<DonationProvider>()
                              .addDonation(donation);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "QR Code",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  "A QR code will be generated after your donation has been confirmed by the organization.",
                                  style: TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        if (_modeOfDelivery == "Drop off") {
                          Donation donation = Donation(
                            userId: "2",
                            donorName: "Myndie Labiano",
                            orgId: "1",
                            itemType: _itemType,
                            status: "Pending",
                            address: "none",
                            contactNumber: "none",
                            modeOfDelivery: _modeOfDelivery,
                            weight: _weight,
                            dateTime: _stringFinalDateTime!,
                          );
                          context
                              .read<DonationProvider>()
                              .addDonation(donation);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Success!'),
                        ));

                        // Navigator.of(context).pop();
                      });
                    },
                    child:
                        Text("Donate", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.39),
                    ),
                    onPressed: () {},
                    child: Text("Cancel"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
