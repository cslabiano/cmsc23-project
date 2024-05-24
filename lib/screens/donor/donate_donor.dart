import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
  String _weight = '';
  String _modeOfDelivery = 'Drop off';

  List<String> _itemType = [];
  List<bool> _selectedMode = [true, false];

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  bool get _isAnyChecked =>
      _food || _clothes || _cash || _necessities || _others;

  String formatTimeofDay(TimeOfDay timeOfDay) {
    final String hour = timeOfDay.hour.toString().padLeft(2, '0');
    final String minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
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
                Text(
                  "Weight of the items to donate (kg)",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold, height: 1),
                ),
                SizedBox(height: 10),
                TextFormField(
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
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
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold, height: 1),
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
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
                              firstDate: DateTime(2000),
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
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
                          if (selectedTime != null) {
                            _time = selectedTime;
                            _timeController.text =
                                formatTimeofDay(selectedTime);
                          }
                        },
                      ),
                    )
                  ],
                ),
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
                      if (!_isAnyChecked) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Please select at least one checkbox.')),
                        );
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save;
                      }
                      setState(() {
                        _finalDateTime = DateTime(_date!.year, _date!.month,
                            _date!.day, _time!.hour, _time!.minute);
                        if (_food) {
                          _itemType.add("Food");
                        }
                        if (_clothes) {
                          _itemType.add("Clothes");
                        }
                        if (_cash) {
                          _itemType.add("Cash");
                        }
                        if (_necessities) {
                          _itemType.add("Necessities");
                        }
                        if (_others) {
                          _itemType.add("Others");
                        }
                        print("Success");
                        print("$_isAnyChecked");
                        print('$_itemType');
                        print('$_modeOfDelivery');
                        print('$_finalDateTime');
                        print('$_weight');
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
