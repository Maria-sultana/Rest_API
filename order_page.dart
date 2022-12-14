import 'dart:convert';

import 'package:login/const/app_color.dart';
import 'package:login/custom-http/custom_http.dart';
import 'package:login/model/all_order_model.dart';
import 'package:login/providers/order_provers.dart';
import 'package:login/widgets/common_widget.dart';
import 'package:login/widgets/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  
  @override
  void initState() { 
    Provider.of<OrderProvider>(context, listen: false).getOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final  orderList = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kbgcolor,
        elevation: 0,
        title: Text(
          "Order",
          style: TextStyle(color: Colors.white, fontSize: 26.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  var clr =
                      orderList[index].orderStatus!.orderStatusCategory!.id;
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 15.h, left: 15.w, right: 15.w, bottom: 15.h),
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ), //Offset
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          clr == 1
                                              ? Icons.snowmobile_sharp
                                              : clr == 2
                                                  ? Icons.abc
                                                  : Icons.zoom_in_map_sharp,
                                          color: clr == 1
                                              ? Colors.red
                                              : clr == 2
                                                  ? Colors.green
                                                  : Colors.blue,
                                        ),
                                        Text(
                                            "Order Id: " +
                                                orderList[index].id.toString(),
                                            style: myStyle(16.sp, Colors.cyan,
                                                FontWeight.w700)),
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Name:${orderList[index].user!.name} ",
                                            style: myStyle(14.sp, Colors.teal,
                                                FontWeight.w700)),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Text("Price: ${orderList[index].price}",
                                            style: myStyle(
                                                16.sp,
                                                AppColor.kbgcolor,
                                                FontWeight.w700)),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
