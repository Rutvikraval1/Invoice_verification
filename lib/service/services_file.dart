import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../model/invoice_class.dart';

class Network{
  List final_invoice_data =[];
  Future<dynamic> loadJsonData() async {
    List Po_number=[];

      String jsonData = await rootBundle.loadString('asset/file/GetPOPending.json');
      final dataList =invoiveResponseFromJson(jsonData);
      final invoice_data= dataList.poPending.cast<InvoiceItem>();

      for(int i=0;i<invoice_data.length;i++){
        Map table_data={
          'type':invoice_data[i].materialName.toString(),
          'line_no':invoice_data[i].poLineItem.toString(),
          'hXw':invoice_data[i].description.toString(),
          'sqft':invoice_data[i].squareFeet.toString(),
          'amount':invoice_data[i].amount.toString(),
          'vendor_sqft':invoice_data[i].vendorSquareFeet.toString(),
          'vendor_amt':invoice_data[i].vendorAmount.toString(),
        };
        Map card_item_value={
          'dealerName':invoice_data[i].dealerName,
          'dealerCode':invoice_data[i].dealerCode,
          'poNumber':invoice_data[i].poNumber,
          'vender':invoice_data[i].vender,
          'pono':invoice_data[i].pono,
          'poDate':invoice_data[i].poDate,
          'poRecDate':invoice_data[i].poRecDate,
          'invoiceNo':invoice_data[i].invoiceNo,
          'invoiceDate':invoice_data[i].invoiceDate,
          'survCreatedDate':invoice_data[i].survCreatedDate,
          'workComplete':invoice_data[i].workComplete,
          'amount':invoice_data[i].amount,
          'vendorAmount':invoice_data[i].vendorAmount,
          'lastApproveby':invoice_data[i].lastApproveby,
          'poFile':invoice_data[i].poFile,
          'invoicePath':invoice_data[i].invoicePath,
          'remark':invoice_data[i].remark,
          'tabledata':[]
        };
        if(!Po_number.contains(invoice_data[i].poNumber.toString())){
          Po_number.add(invoice_data[i].poNumber.toString());
          card_item_value['tabledata'].add(table_data);
          card_item_value['table_check']=true;
          final_invoice_data.add(card_item_value);
        }else{
          if(Po_number.contains(invoice_data[i].poNumber.toString())){
            print("step 1");
            for(int j=0;j<final_invoice_data.length;j++){
              print("step 2");
              if(invoice_data[i].poNumber.toString()==final_invoice_data[j]['poNumber'].toString()){
                print("step 3");
                final_invoice_data[j]['tabledata'].add(table_data);
                break;
              }
            }
          }
        }
      }

      return final_invoice_data ;
  }








}