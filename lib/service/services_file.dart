import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

import '../model/invoice_class.dart';

class Network{

  Future<InvoiveResponse> loadJsonData() async {
      String jsonData = await rootBundle.loadString('asset/file/GetPOPending.json');
      return invoiveResponseFromJson(jsonData);
  }
}