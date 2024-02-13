
import 'dart:convert';

InvoiveResponse invoiveResponseFromJson(String str) => InvoiveResponse.fromJson(json.decode(str));

String invoiveResponseToJson(InvoiveResponse data) => json.encode(data.toJson());

class InvoiveResponse {
  String responseCode;
  String message;
  List<InvoiceItem> poPending;

  InvoiveResponse({
    required this.responseCode,
    required this.message,
    required this.poPending,
  });

  factory InvoiveResponse.fromJson(Map<String, dynamic> json) => InvoiveResponse(
    responseCode:  json['responseCode']??"",
    message: json["message"]??'',
    poPending: List<InvoiceItem>.from(json["poPending"].map((x) => InvoiceItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode":responseCode,
    "message": message,
    "poPending": List<dynamic>.from(poPending.map((x) => x.toJson())),
  };
}

class InvoiceItem {
  double? positionNo;
  String? submitBy;
  String? lastApproveby;
  double? rid;
  double? poNumber;
  String? pono;
  String? poDate;
  String? sdCode;
  String? salesDesc;
  String? dealerCode;
  String? dealerName;
  String? deliveryAt;
  String? district;
  String? state;
  String? stateDesc;
  String? contactNo;
  String? deliveryDate;
  String? vendorCode;
  double? coordinateNo;
  String? process;
  String? poLineItem;
  String? size;
  String? materialName;
  double? iRate;
  String? description;
  String? vender;
  String? poFile;
  String? invoiceNo;
  String? invoiceDate;
  double? iLevelId;
  double? approvalPositionNo;
  double? supPositionNo;
  double? designationNo;
  String? poReceivedDate;
  String? remark;
  String? invoicePath;
  String? workComplete;
  double? vendorAmount;
  double? vendorSquareFeet;
  String? poRecDate;
  double? amount;
  double? squareFeet;
  String? survCreatedDate;
  var approvalFlagnPositionNo;
  String? approvalFlag;

  InvoiceItem({
     this.positionNo,
     this.submitBy,
     this.lastApproveby,
     this.rid,
     this.poNumber,
     this.pono,
     this.poDate,
     this.sdCode,
     this.salesDesc,
     this.dealerCode,
     this.dealerName,
     this.deliveryAt,
     this.district,
     this.state,
     this.stateDesc,
     this.contactNo,
     this.deliveryDate,
     this.vendorCode,
     this.coordinateNo,
     this.process,
     this.poLineItem,
     this.size,
     this.materialName,
     this.iRate,
     this.description,
     this.vender,
     this.poFile,
     this.invoiceNo,
     this.invoiceDate,
     this.iLevelId,
     this.approvalPositionNo,
     this.supPositionNo,
     this.designationNo,
     this.poReceivedDate,
     this.remark,
     this.invoicePath,
     this.workComplete,
     this.vendorAmount,
     this.vendorSquareFeet,
     this.poRecDate,
     this.amount,
     this.squareFeet,
     this.survCreatedDate,
     this.approvalFlagnPositionNo,
     this.approvalFlag,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
          positionNo: double.parse(json['positionNo'].toString()),
      submitBy: json['submitBy']??'',
      lastApproveby: json['lastApproveby']??'',
      rid: double.parse(json['rid'].toString()),
      poNumber:double.parse(json['poNumber'].toString()),
      pono: json['pono']??'',
      poDate: json['poDate']??'',
      sdCode: json['sdCode']??'',
      salesDesc: json['sales_Desc'] ??'',
      dealerCode: json['dealerCode']??'',
      dealerName: json['dealerName']??'',
      deliveryAt: json['deliveryAt']??'',
      district: json['district'] ??'',
      state: json['state']??'',
      stateDesc: json['state_Desc']??'',
      contactNo: json['contactNo'] ??'',
      deliveryDate: json['delryDateive']??'',
      vendorCode: json['vendorCode']??'',
      coordinateNo: double.parse(json['cordinateNo'].toString()),
      process: json['process']??'',
      poLineItem: json['poLineItem']??'',
      size: json['size']??'',
      materialName: json['materialName']??'',
      iRate:double.parse(json['iRate'].toString()),
      description: json['description']??'',
      vender: json['vender']??'',
      poFile: json['poFile']??'',
      invoiceNo: json['invoiceNo']??'',
      invoiceDate: json['invoiceDate']??'',
      iLevelId: double.parse(json['iLevelId'].toString()),
      approvalPositionNo: double.parse(json['approvalPositionNo'].toString()),
      supPositionNo: double.parse(json['supPositionNo'].toString()),
      designationNo:double.parse(json['designationNo'].toString()),
      poReceivedDate: json['pOreceivedate'],
      remark: json['remark']??'',
      invoicePath: json['invoicePath']??'',
      workComplete: json['workComplet']??'',
      vendorAmount: double.parse(json['vendorAmount'].toString()),
      vendorSquareFeet: double.parse(json['vendorSquareFeet'].toString()),
      poRecDate: json['poRecDate']??'',
      amount: double.parse(json['amount'].toString()),
      squareFeet:double.parse(json['squareFeet'].toString()),
      survCreatedDate: json['survCreatedDate']??'',
    approvalFlagnPositionNo: json['approvalFlagnPositionNo'],
      approvalFlag: json['approvalFlag']??'',
  );

  Map<String, dynamic> toJson() => {
    "positionNo": positionNo,
    "submitBy": submitBy,
    "lastApproveby": lastApproveby,
    "rid": rid,
    "poNumber": poNumber,
    "pono": pono,
    "poDate": poDate,
    "sdCode": sdCode,
    "sales_Desc": salesDesc,
    "dealerCode": dealerCode,
    "dealerName": dealerName,
    "deliveryAt": deliveryAt,
    "district": district,
    "state": state,
    "state_Desc": stateDesc,
    "contactNo":contactNo,
    "delryDateive": deliveryDate,
    "vendorCode": vendorCode,
    "cordinateNo": coordinateNo,
    "process": process,
    "poLineItem": poLineItem,
    "size": size,
    "materialName": materialName,
    "iRate": iRate,
    "description": description,
    "vender": vender,
    "poFile": poFile,
    "invoiceNo": invoiceNo,
    "invoiceDate": invoiceDate,
    "iLevelId": iLevelId,
    "approvalPositionNo": approvalPositionNo,
    "supPositionNo": supPositionNo,
    "designationNo": designationNo,
    "pOreceivedate": poReceivedDate,
    "remark":remark,
    "invoicePath": invoicePath,
    "workComplet": workComplete,
    "vendorAmount": vendorAmount,
    "vendorSquareFeet": vendorSquareFeet,
    "poRecDate": poRecDate,
    "amount": amount,
    "squareFeet": squareFeet,
    "survCreatedDate": survCreatedDate,
    "approvalFlagnPositionNo": approvalFlagnPositionNo,
    "approvalFlag": approvalFlag,
  };
}


