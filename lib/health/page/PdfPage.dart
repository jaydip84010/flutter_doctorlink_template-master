import 'dart:async';
import 'dart:io';
import 'package:doctorapp/health/model/RowItem.dart';
import 'package:doctorapp/health/utils/ConstantData.dart';
import 'package:doctorapp/health/utils/ConstantWidget.dart';
import 'package:doctorapp/health/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfPage extends StatefulWidget {
  final String pdfName;
  final RowItem rowItem;

  PdfPage(this.pdfName, this.rowItem);

  @override
  _PdfPage createState() {
    return _PdfPage();
  }
}

class _PdfPage extends State<PdfPage> {
  Color themeColor = ConstantData.primaryColor;
  RowItem? rowItem;

  int colorPosition = 0;
  String pathPDF = "";

  File? doc;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    rowItem = widget.rowItem;
    themeColor = rowItem!.color!;
    SizeConfig().init(context);

    return ConstantWidget.getSubDefaultWidget(
      context,
      getMainWidget(),
      rowItem!,
      _requestPop,
    );
  }

  PdfController? pdfPinchController;

  getMainWidget() {
    PdfController pdfPinchController = PdfController(
      document: PdfDocument.openAsset('${ConstantData.pdfPath}${widget.pdfName}'),
    );
    print("psd====${widget.pdfName}");
    return Center(
      child: PdfView(
        controller: pdfPinchController,
        scrollDirection: Axis.vertical,
        onDocumentLoaded: (document) {
          print("document");
        },
      ),
    );
  }

  getWidget(String s, String s1, String s3, bool isBold) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.8);

    Color color = themeColor;

    FontWeight f = (isBold) ? FontWeight.w800 : FontWeight.w400;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ConstantWidget.getScreenPercentSize(context, 1)),
      margin: EdgeInsets.symmetric(
          vertical: ConstantWidget.getScreenPercentSize(context, 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(
                  s, FontWeight.w800, 1, textSize, color),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child:
                  ConstantWidget.textOverFlowWidget(s1, f, 1, textSize, color),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: ConstantWidget.textOverFlowWidget(s3, f, 1, textSize, color),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  getText(String s) {
    double textSize = ConstantWidget.getScreenPercentSize(context, 1.5);

    return Expanded(
      child: ConstantWidget.getDefaultTextWidget(s, TextAlign.center,
          FontWeight.w500, textSize, ConstantData.textColor),
      flex: 1,
    );
  }
}
