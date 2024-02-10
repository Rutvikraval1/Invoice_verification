
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/invoice_class.dart';
import '../service/services_file.dart';
import '../utils/custColors.dart';
import '../utils/text_style.dart';
import '../widget/Scaffold_widget.dart';
import '../widget/navigate_btn.dart';
import 'dart:convert';
import 'dart:io';

class dasboard extends StatefulWidget {
  const dasboard({super.key});

  @override
  State<dasboard> createState() => _dasboardState();
}

class _dasboardState extends State<dasboard> {

  ScrollController scollBarController = ScrollController();
  List rigth_side_icon=[
    Icons.menu_outlined,
    Icons.image,
    Icons.file_copy_outlined,
    Icons.file_present,
  ];


  @override
  void initState() {
    // TODO: implement initState
    get_invoice_data();
    super.initState();
  }

  bool isloader=false;
  List<bool> all_check_card=[];
  List<InvoiceItem> invoice_data =[];
  List<bool> check_card=[];

  List selected_name=[];
  get_invoice_data() async {
   var dataList =  await  Network().loadJsonData();
    invoice_data= dataList.poPending.cast<InvoiceItem>();
   selected_name = List<String>.filled( invoice_data.length, '');
   check_card = List<bool>.filled( invoice_data.length, false);
   all_check_card = List<bool>.filled( invoice_data.length, false);
   isloader=true;
   setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
      appBar: AppBar(
        backgroundColor: AppColors.main_red_Color,
        leading: Icon(Icons.arrow_back_rounded,color: AppColors.whiteColor,),
        title: Text('Invoice Verification',style: text_style.appbar_text_style,),
        actions: [
          Icon(Icons.calendar_today,color: AppColors.whiteColor,),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.search_rounded,color: AppColors.whiteColor,),
          )
        ],
      ),
      body:isloader?Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: all_check_card.first,
                  activeColor: AppColors.main_red_Color,
                  onChanged:(value){
                    if(value!){
                      all_check_card = List<bool>.filled( invoice_data.length, true);
                      check_card=List<bool>.filled( invoice_data.length, true);
                      for(int i=0;i<invoice_data.length;i++){
                        selected_name[i]=invoice_data[i].dealerName;
                      }
                      setState(() {});
                    }else{
                      all_check_card = List<bool>.filled( invoice_data.length, false);
                      check_card=List<bool>.filled( invoice_data.length, false);
                      selected_name = List<String>.filled( invoice_data.length, '');
                      print("selected_name");
                      print(selected_name);
                      setState(() {});
                    }
                  },),
                Text('SelectAll')
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: invoice_data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 3.0)
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(8),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('${invoice_data[index].dealerName} [${invoice_data[index].dealerCode}]',style: text_style.textSize16_main_red_style,overflow: TextOverflow.ellipsis
                                        ,maxLines: 2,),
                                    ),
                                    Checkbox(value: check_card[index],
                                      activeColor: AppColors.main_red_Color,
                                      onChanged:(value){
                                      if(value!){
                                        check_card[index]=value;
                                        selected_name[index]=invoice_data[index].dealerName;
                                      }else{
                                        check_card[index]=value;
                                        selected_name[index]='';
                                      }
                                        setState(() {});
                                      },),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Text('Vendor',style: text_style.textSize12_grey_style,),
                                Text(invoice_data[index].vender.toString(),style:text_style.textSize13_main_red_style ,),
                                SizedBox(height: 8,),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('PO Number',style:text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].pono.toString(),style:text_style().textSize14_grey400_style ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('PO Date',style: text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].poDate.toString(),style: text_style.textSize13_main_red_style),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('PO Receive \nDate',textAlign: TextAlign.center,style: text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].poRecDate.toString(),style:text_style.textSize13_main_red_style),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('Invoice Number',style:text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].invoiceNo.toString(),style: text_style().textSize14_grey400_style ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('Invoice Date',style: text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].invoiceDate.toString(),style: text_style.textSize13_main_red_style),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('Dealer Creation Date',style:text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].survCreatedDate.toString(),style: text_style.textSize13_main_red_style ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('PO Completion Date',style: text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].workComplete.toString(),style: text_style.textSize13_main_red_style),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('Total Budget(\u{20B9})',style:text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].amount.toString(),style: text_style().textSize14_grey700_style ),
                                          ],
                                        ),
                                      ),
                                      VerticalDivider(),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Text('Consumed Budget(\u{20B9})',style: text_style().textSize14_grey700_style),
                                            Text(invoice_data[index].vendorAmount.toString(),style: text_style().textSize14_grey700_style),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                //table

                                Scrollbar(
                                  controller:scollBarController,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      headingRowColor:
                                      MaterialStateColor.resolveWith(
                                              (states) => AppColors.ligth_blue_Color),
                                      headingTextStyle: text_style()
                                          .textSize12_style,
                                      headingRowHeight: 25,
                                      // dataRowHeight: 40,
                                      showBottomBorder: true,
                                      border: TableBorder.all(color: AppColors().grey400_Color),
                                      columns: const [
                                        DataColumn(label: Center(child: Text('Type'))),
                                        DataColumn(label: Text('Line Item No'),),
                                        DataColumn(label: Text('H x W'),),
                                        DataColumn(label: Text('Sqft'),),
                                        DataColumn(label: Text('Amount(\u{20B9})'),),
                                        DataColumn(label: Text('Vendor Sqft'),),
                                        DataColumn(label: Text('Vendor Amt(\u{20B9})'),),
                                      ],
                                      rows: [
                                        DataRow(
                                            cells:[
                                              DataCell(SizedBox(width: 80, child: Text(invoice_data[index].materialName.toString()))),
                                              DataCell(Text(invoice_data[index].poLineItem.toString())),
                                              DataCell(Text(invoice_data[index].description.toString())),
                                              DataCell(Text(invoice_data[index].squareFeet.toString())),
                                              DataCell(Text(invoice_data[index].amount.toString())),
                                              DataCell(Text(invoice_data[index].vendorSquareFeet.toString())),
                                              DataCell(Text(invoice_data[index].vendorAmount.toString())),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Text('Last Approved',style: text_style.textSize12_grey_style),
                                Text(invoice_data[index].lastApproveby.toString(),style: text_style.textSize14_black_style),
                                SizedBox(height: 10,),
                                Text('Remark',style: text_style.textSize12_grey_style),
                                Text(invoice_data[index].remark.toString(),style: text_style.textSize14_black_style)

                              ],
                            ),
                          )),
                          SizedBox(width: 8,),
                          SizedBox(
                            width: 40,
                            child: ListView.builder(
                              itemCount: rigth_side_icon.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index1) => Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Icons_card(
                                      icon: rigth_side_icon[index1],
                                      ontap: (){
                                        print(index);
                                        if(index1==2){
                                          _launchURL(invoice_data[index].poFile.toString());
                                        }else if(index1==3){
                                          _launchURL(invoice_data[index].invoicePath.toString());
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: Duration(seconds: 5),
                                                content: Text('Link not found'),
                                              )
                                          );
                                        }
                                      },
                                      topside_radius: index1==0?'true':'',
                                      bottomside_radius: index1==3?'true':''
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),),
                          )
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        height: MediaQuery.of(context).size.height/14,
        child: BottomAppBar(
          elevation: 0,
          color: AppColors.main_red_Color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/3.5,
                child: NavigateBtn(
                  text: 'Reject',
                  onPressed: ()  {
                    List name_list=[];
                    for(int i=0;i<selected_name.length;i++){
                      if(selected_name[i]!=''){
                        name_list.add(selected_name[i]);
                      }
                    }

                    if(name_list.isNotEmpty){
                      Show_Dialog_box(context: context,title_name: 'Reject User name',selected_name: name_list);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 5),
                            content: Text('Please check name'),
                          )
                      );
                    }
                  },
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width/3.5,
                child: NavigateBtn(
                  text: 'Approve',
                  onPressed: ()  {
                    List name_list=[];
                    for(int i=0;i<selected_name.length;i++){
                      if(selected_name[i]!=''){
                        name_list.add(selected_name[i]);
                      }
                    }
                    if(name_list.isNotEmpty){
                      Show_Dialog_box(context: context,title_name: 'Approve User name',selected_name:name_list);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 5),
                            content: Text('Please check name'),
                          )
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  _launchURL(String file_link) async {
    final Uri url = Uri.parse(file_link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }


  Widget Icons_card({required IconData icon,required Function ontap, String topside_radius='',String bottomside_radius=''}){
    return InkWell(
      onTap: (){
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.ligth_blue_Color,
          borderRadius:topside_radius!=''? BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
              :bottomside_radius!=''? BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)):null
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 20),
          child: Icon(icon,size: 16,color: AppColors.whiteColor,),
        ),
      ),
    );
  }


  void Show_Dialog_box({required BuildContext context,
    required String title_name,
required List  selected_name,
  }) {
    showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
              actionsPadding:
              const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              title:  Column(
                children: [
                  Text(title_name),
                  Divider(),
                ],
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigateBtn(
                      text: 'Close',
                      onPressed: ()  {
                        Navigator.of(context).pop(false);
                      },
                    )
                  ],
                ),
              ],
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 3.3,
              width: MediaQuery.of(context).size.width / 1,
              child: ListView.builder(
                itemCount: selected_name.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Column(
                children: [
                  Row(
                    children: [
                      Text('${index+1}.'),
                      Text(selected_name[index].toString()),
                    ],
                  ),
                  Divider(),
                  // SizedBox(height: 10,)
                ],
              ),),
            ),
          );
        });
  }
}
