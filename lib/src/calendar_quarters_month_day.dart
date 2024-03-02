import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarQuartersMonthDay extends StatefulWidget {
  const CalendarQuartersMonthDay(
      {super.key,
      required this.locale,
      this.callbackFunction,
      this.initialDate});

  final String locale;
  final dynamic callbackFunction;
  final DateTime? initialDate;
  @override
  State<CalendarQuartersMonthDay> createState() =>
      _CalendarQuartersMonthDayState();
}

class _CalendarQuartersMonthDayState extends State<CalendarQuartersMonthDay> {
  int _chosenIndex = 0;
  List<DateTime> chosenDates = [];
  void _showDialog(String locale) async {
    await showDialog(
        context: context,
        builder: (context) {
          if (Platform.isAndroid) {
            return showCalendarQuartersMonthDayDialog(locale, true);
          } else {
            return showCalendarQuartersMonthDayDialog(locale, false);
          }
        }).then((value) {
      widget.callbackFunction(chosenDates);
    });
  }

  StatefulBuilder showCalendarQuartersMonthDayDialog(
      String locale, bool isAndroid) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _chosenIndex = 0;
                  });
                },
                child: DialogHeading(
                  label: "Day",
                  isChosen: _chosenIndex == 0,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _chosenIndex = 1;
                  });
                },
                child: DialogHeading(
                  label: "Month",
                  isChosen: _chosenIndex == 1,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _chosenIndex = 2;
                  });
                },
                child: DialogHeading(
                  label: "Quarters",
                  isChosen: _chosenIndex == 2,
                ),
              ),
            ),
          ],
        ),
        content: Container(
          child: _chosenIndex == 0
              ? DayPicker(
                  locale: widget.locale,
                  initialDate: widget.initialDate,
                  callbackFunction: (List<DateTime> dates) {
                    chosenDates = dates;
                  },
                )
              : _chosenIndex == 1
                  ? MonthPicker(
                      locale: widget.locale,
                      initialYear: DateTime.now(),
                      callbackFunction: (List<DateTime> dates) {
                        chosenDates = dates;
                      },
                    )
                  : QuarterPicker(
                      locale: widget.locale,
                      initialYear: DateTime.now(),
                      callbackFunction: (List<DateTime> dates) {
                        chosenDates = dates;
                      },
                    ),
        ),
        actions: [
          isAndroid
              ? TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    locale: Locale(locale),
                  ))
              : CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    locale: Locale(locale),
                  ),
                ),
          isAndroid
              ? TextButton(
                  onPressed: () {
                    Navigator.pop(context, {"dates": chosenDates});
                  },
                  child: Text(
                    "OK",
                    locale: Locale(locale),
                  ))
              : CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, {"dates": chosenDates});
                  },
                  child: Text(
                    "OK",
                    locale: Locale(locale),
                  ),
                ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quarters Month Day Calendar Picker"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(widget.locale);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DialogHeading extends StatelessWidget {
  const DialogHeading({
    super.key,
    required this.isChosen,
    required this.label,
    this.activeColor,
    this.activeLabelColor,
    this.inActiveColor,
    this.inActiveLabelColor,
    this.activeTextStyle,
    this.inActiveTextStyle,
  });
  final bool isChosen;
  final String label;
  final Color? activeColor;
  final Color? activeLabelColor;
  final Color? inActiveColor;
  final Color? inActiveLabelColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inActiveTextStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isChosen ? activeColor ?? Colors.blueGrey : inActiveColor,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        label,
        maxLines: 1,
        style: isChosen ? activeTextStyle : inActiveTextStyle,
        overflow: TextOverflow.ellipsis,
        // style: Theme.of(context).textTheme.displayLarge,
      )),
    );
  }
}

class DayPicker extends StatefulWidget {
  const DayPicker(
      {super.key,
      this.callbackFunction,
      this.initialDate,
      required this.locale});
  final dynamic callbackFunction;
  final String locale;
  final DateTime? initialDate;
  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          await showDatePicker(
            context: context,
            locale: Locale(widget.locale),
            initialDate: widget.initialDate,
            firstDate: DateTime(1970),
            lastDate: DateTime(3000),
          ).then((value) {
            if (value != null) {
              setState(() {
                selectedDate = value;
              });
              List<DateTime> dates = [value, value];
              widget.callbackFunction(dates);
            }
          });
        },
        child: Text(selectedDate == null
            ? "Select Date"
            : DateFormat('yyyy-MM-dd').format(selectedDate!)),
      ),
    );
  }
}

class MonthPicker extends StatefulWidget {
  const MonthPicker(
      {super.key,
      required this.initialYear,
      this.callbackFunction,
      this.chosenColor,
      this.locale});
  final DateTime initialYear;
  final dynamic callbackFunction;
  final String? locale;
  final Color? chosenColor;
  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  int yearText = -1;
  int chosenMonth = -1;
  DateTime? dateSelected;
  @override
  void initState() {
    yearText = widget.initialYear.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      yearText--;
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(yearText.toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      yearText++;
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final DateTime dateTime = DateTime(yearText, index + 1);
                      final nextMonth =
                          (dateTime.month < 12) ? dateTime.month + 1 : 1;
                      final nextYear = (dateTime.month < 12)
                          ? dateTime.year
                          : dateTime.year + 1;
                      final DateTime endOfMonth =
                          DateTime(nextYear, nextMonth, 1)
                              .subtract(Duration(days: 1));
                      setState(() {
                        chosenMonth = index;
                      });
                      dateSelected = DateTime(yearText, index + 1);
                      widget.callbackFunction(
                          [DateTime(yearText, index + 1, 1), endOfMonth]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: chosenMonth == index
                              ? widget.chosenColor ?? Colors.blueGrey
                              : null),
                      child: Center(
                        child:
                            Text(DateFormat.MMM(widget.locale).format(DateTime(
                          widget.initialYear.year,
                          index + 1,
                        ))),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class QuarterPicker extends StatefulWidget {
  const QuarterPicker(
      {super.key,
      required this.initialYear,
      this.callbackFunction,
      this.locale,
      this.chosenColor});
  final DateTime initialYear;
  final dynamic callbackFunction;
  final String? locale;
  final Color? chosenColor;
  @override
  State<QuarterPicker> createState() => _QuarterPickerState();
}

class _QuarterPickerState extends State<QuarterPicker> {
  int yearText = -1;
  int chosenQuarter = -1;
  DateTime? dateSelected;
  @override
  void initState() {
    yearText = widget.initialYear.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      yearText--;
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(yearText.toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      yearText++;
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenQuarter = index;
                      });
                      List<DateTime> dates = getQuarterDates(yearText, index);
                      widget.callbackFunction(dates);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: chosenQuarter == index
                              ? widget.chosenColor ?? Colors.blueGrey
                              : null),
                      child: Center(
                        child: Text(getQuarter(
                            index, yearText, widget.locale ?? "en_US")),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

String getQuarter(int index, int year, String locale) {
  switch (index) {
    case 0:
      return "${DateFormat.MMM(locale).format(DateTime(year, 1))}-${DateFormat.MMM(locale).format(DateTime(year, 3))}";
    case 1:
      return "${DateFormat.MMM(locale).format(DateTime(year, 4))}-${DateFormat.MMM(locale).format(DateTime(year, 6))}";
    case 2:
      return "${DateFormat.MMM(locale).format(DateTime(year, 7))}-${DateFormat.MMM(locale).format(DateTime(year, 9))}";
    case 3:
      return "${DateFormat.MMM(locale).format(DateTime(year, 10))}-${DateFormat.MMM(locale).format(DateTime(year, 12))}";
    default:
      return "";
  }
}

List<DateTime> getQuarterDates(int year, int quarterIndex) {
  // Calculate the start and end dates of the quarter based on the quarter index
  DateTime startDate;
  DateTime endDate;

  switch (quarterIndex) {
    case 0: // Jan-March
      startDate = DateTime(year, DateTime.january, 1);
      endDate = DateTime(year, DateTime.march, 31);
      break;
    case 1: // Apr-Jun
      startDate = DateTime(year, DateTime.april, 1);
      endDate = DateTime(year, DateTime.june, 30);
      break;
    case 2: // July-Sep
      startDate = DateTime(year, DateTime.july, 1);
      endDate = DateTime(year, DateTime.september, 30);
      break;
    case 3: // Oct-Dec
      startDate = DateTime(year, DateTime.october, 1);
      endDate = DateTime(year, DateTime.december, 31);
      break;
    default:
      throw ArgumentError('Invalid quarter index: $quarterIndex');
  }

  return [startDate, endDate];
}
