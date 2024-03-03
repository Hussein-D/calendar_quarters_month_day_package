import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarQuartersMonthDay extends StatefulWidget {
  const CalendarQuartersMonthDay(
      {super.key,
      required this.locale,
      this.callbackFunction,
      this.activeHeadingContainerColor,
      this.inActiveHeadingContainerColor,
      this.activeHeadingTextStyle,
      this.inActiveHeadingTextStyle,
      this.initialDate,
      this.monthsYearHeadingTextStyle,
      this.monthsTextStyle,
      this.monthsHeadingLeftIcon,
      this.monthsHeadingRightIcon,
      this.monthsBorderRadius,
      this.monthsActiveColor,
      this.monthsInactiveColor,
      this.quartersYearHeadingTextStyle,
      this.quartersTextStyle,
      this.quartersHeadingLeftIcon,
      this.quartersHeadingRightIcon,
      this.quartersBorderRadius,
      this.quartersActiveColor,
      this.quartersInactiveColor,
      this.textStyle,
      this.selectADateTextStyle,
      this.barrierDismissible,
      this.cancelTextStyle,
      this.okTextStyle,
      this.okText,
      this.cancelText});
  final TextStyle? cancelTextStyle;
  final TextStyle? okTextStyle;
  final String? okText;
  final String? cancelText;
  final TextStyle? selectADateTextStyle;
  final bool? barrierDismissible;
  final Color? activeHeadingContainerColor;
  final Color? inActiveHeadingContainerColor;
  final TextStyle? activeHeadingTextStyle;
  final TextStyle? inActiveHeadingTextStyle;
  final TextStyle? monthsYearHeadingTextStyle;
  final TextStyle? monthsTextStyle;
  final Icon? monthsHeadingLeftIcon;
  final Icon? monthsHeadingRightIcon;
  final double? monthsBorderRadius;
  final Color? monthsActiveColor;
  final Color? monthsInactiveColor;
  final TextStyle? quartersYearHeadingTextStyle;
  final TextStyle? quartersTextStyle;
  final Icon? quartersHeadingLeftIcon;
  final Icon? quartersHeadingRightIcon;
  final double? quartersBorderRadius;
  final Color? quartersActiveColor;
  final Color? quartersInactiveColor;
  final String locale;
  final dynamic callbackFunction;
  final DateTime? initialDate;
  final TextStyle? textStyle;
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
        barrierDismissible: widget.barrierDismissible ?? true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            if (Platform.isAndroid) {
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
                        ),
                      ),
                    ),
                  ],
                ),
                content: SizedBox(
                  height: 300,
                  child: _chosenIndex == 0
                      ? DayPicker(
                          locale: widget.locale,
                          textStyle: widget.selectADateTextStyle,
                          initialDate: widget.initialDate,
                          callbackFunction: (List<DateTime> dates) {
                            chosenDates = dates;
                          },
                        )
                      : _chosenIndex == 1
                          ? MonthPicker(
                              locale: widget.locale,
                              leftIcon: widget.monthsHeadingLeftIcon,
                              rightIcon: widget.monthsHeadingRightIcon,
                              activeColor: widget.monthsActiveColor,
                              inActiveColor: widget.monthsInactiveColor,
                              yearTextStyle: widget.monthsYearHeadingTextStyle,
                              monthsTextStyle: widget.monthsTextStyle,
                              borderRadius: widget.monthsBorderRadius,
                              initialYear: DateTime.now(),
                              callbackFunction: (List<DateTime> dates) {
                                chosenDates = dates;
                              },
                            )
                          : QuarterPicker(
                              locale: widget.locale,
                              leftIcon: widget.quartersHeadingLeftIcon,
                              rightIcon: widget.quartersHeadingRightIcon,
                              activeColor: widget.quartersActiveColor,
                              inActiveColor: widget.quartersInactiveColor,
                              yearTextStyle:
                                  widget.quartersYearHeadingTextStyle,
                              textStyle: widget.quartersTextStyle,
                              borderRadius: widget.monthsBorderRadius,
                              initialYear: DateTime.now(),
                              callbackFunction: (List<DateTime> dates) {
                                chosenDates = dates;
                              },
                            ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(widget.cancelText ?? "Cancel",
                        style: widget.cancelTextStyle),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, {"dates": chosenDates});
                      },
                      child: Text(
                        widget.okText ?? "OK",
                        style: widget.okTextStyle,
                        locale: Locale(locale),
                      )),
                ],
              );
            } else {
              return CupertinoAlertDialog(
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
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
                          activeTextStyle: widget.activeHeadingTextStyle,
                          inActiveTextStyle: widget.inActiveHeadingTextStyle,
                          activeColor: widget.activeHeadingContainerColor,
                          inActiveColor: widget.inActiveHeadingContainerColor,
                        ),
                      ),
                    ),
                  ],
                ),
                content: SizedBox(
                  height: 300,
                  child: _chosenIndex == 0
                      ? DayPicker(
                          locale: widget.locale,
                          textStyle: widget.selectADateTextStyle,
                          initialDate: widget.initialDate,
                          callbackFunction: (List<DateTime> dates) {
                            chosenDates = dates;
                          },
                        )
                      : _chosenIndex == 1
                          ? MonthPicker(
                              locale: widget.locale,
                              leftIcon: widget.monthsHeadingLeftIcon,
                              rightIcon: widget.monthsHeadingRightIcon,
                              activeColor: widget.monthsActiveColor,
                              inActiveColor: widget.monthsInactiveColor,
                              yearTextStyle: widget.monthsYearHeadingTextStyle,
                              monthsTextStyle: widget.monthsTextStyle,
                              borderRadius: widget.monthsBorderRadius,
                              initialYear: DateTime.now(),
                              callbackFunction: (List<DateTime> dates) {
                                chosenDates = dates;
                              },
                            )
                          : QuarterPicker(
                              locale: widget.locale,
                              leftIcon: widget.quartersHeadingLeftIcon,
                              rightIcon: widget.quartersHeadingRightIcon,
                              activeColor: widget.quartersActiveColor,
                              inActiveColor: widget.quartersInactiveColor,
                              yearTextStyle:
                                  widget.quartersYearHeadingTextStyle,
                              textStyle: widget.quartersTextStyle,
                              borderRadius: widget.monthsBorderRadius,
                              initialYear: DateTime.now(),
                              callbackFunction: (List<DateTime> dates) {
                                chosenDates = dates;
                              },
                            ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(widget.cancelText ?? "Cancel",
                        style: widget.cancelTextStyle),
                  ),
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context, {"dates": chosenDates});
                      },
                      child: Text(
                        widget.okText ?? "OK",
                        style: widget.okTextStyle,
                        locale: Locale(locale),
                      )),
                ],
              );
            }
          });
        }).then((value) {
      if (value != null) {
        widget.callbackFunction(chosenDates);
        setState(() {});
      }
    });
  }

  String formatDates(DateTime date1, DateTime date2) {
    if (date1 == date2) {
      return DateFormat('MMM dd, yyyy').format(date1);
    } else if (date1.year == date2.year && date1.month == date2.month) {
      return DateFormat('MMM, yyyy').format(date1);
    } else {
      String quarter1 = getQuarterString(date1.month);
      return '$quarter1, ${date1.year}';
    }
  }

  String getQuarterString(int month) {
    switch (month) {
      case 1:
      case 2:
      case 3:
        return 'Jan-Mar';
      case 4:
      case 5:
      case 6:
        return 'Apr-Jun';
      case 7:
      case 8:
      case 9:
        return 'Jul-Sep';
      case 10:
      case 11:
      case 12:
        return 'Oct-Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          _showDialog(widget.locale);
        },
        child: Text(
          chosenDates.isEmpty
              ? "Choose an interval"
              : formatDates(chosenDates.first, chosenDates.last),
          style: widget.textStyle,
          locale: Locale(widget.locale),
        ));
  }
}

class DialogHeading extends StatelessWidget {
  const DialogHeading({
    super.key,
    required this.isChosen,
    required this.label,
    this.activeColor,
    this.inActiveColor,
    this.activeTextStyle,
    this.inActiveTextStyle,
  });
  final bool isChosen;
  final String label;
  final Color? activeColor;
  final Color? inActiveColor;
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
      required this.locale,
      this.textStyle});
  final dynamic callbackFunction;
  final String locale;
  final DateTime? initialDate;
  final TextStyle? textStyle;
  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextButton(
          onPressed: () async {
            await showDatePicker(
              context: context,
              locale: Locale(widget.locale.split("_").first,
                  widget.locale.split("_").last),
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
          child: Text(
            selectedDate == null
                ? "Select Date"
                : DateFormat('yyyy-MM-dd').format(selectedDate!),
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}

class MonthPicker extends StatefulWidget {
  const MonthPicker(
      {super.key,
      required this.initialYear,
      this.callbackFunction,
      this.locale,
      this.yearTextStyle,
      this.monthsTextStyle,
      this.leftIcon,
      this.rightIcon,
      this.borderRadius,
      this.activeColor,
      this.inActiveColor});
  final TextStyle? yearTextStyle;
  final TextStyle? monthsTextStyle;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final double? borderRadius;
  final DateTime initialYear;
  final dynamic callbackFunction;
  final String? locale;
  final Color? activeColor;
  final Color? inActiveColor;
  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  int yearText = -1;
  int chosenMonth = -1;
  DateTime? dateSelected;
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  @override
  void initState() {
    yearText = widget.initialYear.year;
    chosenMonth = widget.initialYear.month - 1;
    dateSelected = widget.initialYear;
    DateTime dateTime = DateTime(yearText, chosenMonth + 1);
    final nextMonth = (dateTime.month < 12) ? dateTime.month + 1 : 1;
    final nextYear = (dateTime.month < 12) ? dateTime.year : dateTime.year + 1;
    DateTime endOfMonth =
        DateTime(nextYear, nextMonth, 1).subtract(const Duration(days: 1));
    firstDate = DateTime(yearText, chosenMonth + 1, 1);
    lastDate = endOfMonth;
    dateSelected = DateTime(yearText, chosenMonth + 1);
    widget.callbackFunction([firstDate, lastDate]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    yearText--;
                    if (chosenMonth != -1) {
                      DateTime dateTime = DateTime(yearText, chosenMonth + 1);
                      final nextMonth =
                          (dateTime.month < 12) ? dateTime.month + 1 : 1;
                      final nextYear = (dateTime.month < 12)
                          ? dateTime.year
                          : dateTime.year + 1;
                      DateTime endOfMonth = DateTime(nextYear, nextMonth, 1)
                          .subtract(const Duration(days: 1));
                      firstDate = DateTime(yearText, chosenMonth + 1, 1);
                      lastDate = endOfMonth;
                      dateSelected = DateTime(yearText, chosenMonth + 1);
                      widget.callbackFunction([firstDate, lastDate]);
                    }
                  });
                },
                icon: widget.leftIcon ?? const Icon(Icons.arrow_back_ios)),
            Text(
              yearText.toString(),
              style: widget.yearTextStyle,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    yearText++;
                    if (chosenMonth != -1) {
                      DateTime dateTime = DateTime(yearText, chosenMonth + 1);
                      final nextMonth =
                          (dateTime.month < 12) ? dateTime.month + 1 : 1;
                      final nextYear = (dateTime.month < 12)
                          ? dateTime.year
                          : dateTime.year + 1;
                      DateTime endOfMonth = DateTime(nextYear, nextMonth, 1)
                          .subtract(const Duration(days: 1));
                      firstDate = DateTime(yearText, chosenMonth + 1, 1);
                      lastDate = endOfMonth;
                      dateSelected = DateTime(yearText, chosenMonth + 1);
                      widget.callbackFunction([firstDate, lastDate]);
                    }
                  });
                },
                icon: widget.rightIcon ?? const Icon(Icons.arrow_forward_ios))
          ],
        ),
        SizedBox(
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
                    DateTime dateTime = DateTime(yearText, index + 1);
                    final nextMonth =
                        (dateTime.month < 12) ? dateTime.month + 1 : 1;
                    final nextYear = (dateTime.month < 12)
                        ? dateTime.year
                        : dateTime.year + 1;
                    DateTime endOfMonth = DateTime(nextYear, nextMonth, 1)
                        .subtract(const Duration(days: 1));
                    firstDate = DateTime(yearText, index + 1, 1);
                    lastDate = endOfMonth;
                    dateSelected = DateTime(yearText, index + 1);
                    setState(() {
                      chosenMonth = index;
                    });
                    widget.callbackFunction([firstDate, lastDate]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 0),
                        color: chosenMonth == index
                            ? widget.activeColor ?? Colors.blueGrey
                            : widget.inActiveColor),
                    child: Center(
                      child: Text(
                        DateFormat.MMM(widget.locale).format(DateTime(
                          widget.initialYear.year,
                          index + 1,
                        )),
                        style: widget.monthsTextStyle,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class QuarterPicker extends StatefulWidget {
  const QuarterPicker(
      {super.key,
      required this.initialYear,
      this.callbackFunction,
      this.locale,
      this.yearTextStyle,
      this.textStyle,
      this.leftIcon,
      this.rightIcon,
      this.borderRadius,
      this.activeColor,
      this.inActiveColor});
  final TextStyle? yearTextStyle;
  final TextStyle? textStyle;
  final DateTime initialYear;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final double? borderRadius;
  final dynamic callbackFunction;
  final String? locale;
  final Color? activeColor;
  final Color? inActiveColor;
  @override
  State<QuarterPicker> createState() => _QuarterPickerState();
}

class _QuarterPickerState extends State<QuarterPicker> {
  int yearText = -1;
  int chosenQuarter = -1;
  @override
  void initState() {
    yearText = widget.initialYear.year;
    chosenQuarter = getQuarterOfYear(widget.initialYear);
    List<DateTime> dates = getQuarterDates(yearText, chosenQuarter);
    widget.callbackFunction(dates);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    yearText--;
                    List<DateTime> dates =
                        getQuarterDates(yearText, chosenQuarter);
                    widget.callbackFunction(dates);
                  });
                },
                icon: widget.leftIcon ?? const Icon(Icons.arrow_back_ios)),
            Text(
              yearText.toString(),
              style: widget.yearTextStyle,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    yearText++;
                    List<DateTime> dates =
                        getQuarterDates(yearText, chosenQuarter);
                    widget.callbackFunction(dates);
                  });
                },
                icon: widget.rightIcon ?? const Icon(Icons.arrow_forward_ios))
          ],
        ),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 6.0, // Spacing between columns
                mainAxisSpacing: 6.0, // Spacing between rows
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
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 0),
                        color: chosenQuarter == index
                            ? widget.activeColor ?? Colors.blueGrey
                            : widget.inActiveColor),
                    child: Center(
                      child: Text(
                        getQuarter(index, yearText, widget.locale ?? "en_US"),
                        style: widget.textStyle,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
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

int getQuarterOfYear(DateTime date) {
  // Determine the month of the date
  int month = date.month;

  // Calculate the quarter based on the month
  if (month >= 1 && month <= 3) {
    return 0;
  } else if (month >= 4 && month <= 6) {
    return 1;
  } else if (month >= 7 && month <= 9) {
    return 2;
  } else {
    return 3;
  }
}
