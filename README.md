# calendar_quarters_month_day_package

[![Pub Version](https://img.shields.io/pub/v/calendar_quarters_month_day)](https://pub.dev/packages/calendar_quarters_month_day)
[![License](https://img.shields.io/github/license/Hussein-D/calendar_quarters_month_day)](LICENSE)

## Description

Calendar Quarters, Months, and Days Picker is a Flutter package designed to simplify the process of selecting intervals of time, whether it's quarters of a year, months, or days.

## Features

- Choose intervals such as quarters of a year, months, or days effortlessly.
- Intuitive and customizable interface.
- Compatible with both Android and iOS platforms.

## Installation

To integrate Calendar Quarters, Months, and Days Picker into your Flutter project, add `calendar_quarters_month_day` as a dependency in your pubspec.yaml file:


![Alt Text](https://github.com/Hussein-D/calendar_quarters_month_day_package/blob/main/images/Screenshot_1709456710.png)

![Alt Text](https://github.com/Hussein-D/calendar_quarters_month_day_package/blob/main/images/Screenshot_1709456713.png)

![Alt Text](https://github.com/Hussein-D/calendar_quarters_month_day_package/blob/main/images/Screenshot_1709456715.png)




```yaml
dependencies:
  calendar_quarters_month_day: ^0.0.2

import 'package:calendar_quarters_month_day/calendar_quarters_month_day.dart';

Usage

Using Calendar Quarters, Months, and Days Picker is simple. Add it to your widget tree and customize it according to your requirements:

CalendarQuartersMonthDay(
        locale: 'en_US',
        callbackFunction: (List<DateTime> dates) {
          print(dates.first);
          print(dates.last);
        },
      ),

Example

Here's a basic example demonstrating how to use Calendar Quarters, Months, and Days Picker to select a quarter of the year:

import 'package:flutter/material.dart';
import 'package:calendar_quarters_month_day/calendar_quarters_month_day.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar Picker Demo'),
        ),
        body: Center(
          child: CalendarQuartersMonthDay(
        locale: 'en_US',
        callbackFunction: (List<DateTime> dates) {
          print(dates.first);
          print(dates.last);
        },
      ),
        ),
      ),
    );
  }
}

Contributing

Contributions to Calendar Quarters, Months, and Days Picker are welcome! Feel free to report bugs, suggest new features, or submit pull requests on GitHub.

License

This package is distributed under the MIT License.

Contact

For questions or feedback, contact dboukhussein55@gmail.com.

```