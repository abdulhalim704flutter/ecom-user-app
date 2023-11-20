import 'package:intl/intl.dart';

String get genarateOrder => 'Order_$getFormattedCurrentDate';


String get getFormattedCurrentDate => DateFormat('yyyy-MM-dd-HH:mm').format(DateTime.now());