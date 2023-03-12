import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmdapp_doctor/utils/pdf/pdfController.dart';

import '../../controllers/homeController.dart';
import './pdfapi.dart';
import 'package:mmdapp_doctor/utils/pdf/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
    final pdfController = Get.put((PdfController()));
  
  static Future<File> generate() async {
    final pdf = Document();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return 
        
        
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: 
            [

              pw.Column(
                
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: 
              [
   pw.Text("PATIENT DETAILS", style: pw.TextStyle(fontSize: 17 , fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),

              pw.Text(pdfController.pdf['name'], style: pw.TextStyle(fontSize: 14 , )),
              pw.SizedBox(height: 5),

              pw.Text("9088787565", style: pw.TextStyle(fontSize: 17 , )),

              ]),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: 
              [
   pw.Text("My Clinic", style: TextStyle(fontSize: 14 , fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),

              pw.Text("Anurag Shakya", style: TextStyle(fontSize: 14)),
              pw.SizedBox(height: 20),
              pw.Text("jhgfhjkhg@gmail.com", style: TextStyle(fontSize: 14)),
              pw.SizedBox(height: 5),

              pw.Text("6765465778", style: TextStyle(fontSize: 14)),
              pw.SizedBox(height: 20),

              pw.Text("PRESCRIPTION", style: TextStyle(fontSize: 18 , fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),

              pw.Text("Date", style: TextStyle(fontSize: 14)),
              pw.SizedBox(height: 10),

              pw.Text("01-01-2023", style: TextStyle(fontSize: 14)),




              ])
           
            ]),
            pw.SizedBox(height: 40),
            pw.Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              pw.Column(children: [
                pw.Text("Description", style: TextStyle(fontSize: 15 , fontWeight: pw.FontWeight.bold ,color: PdfColors.blue)),
                pw.Text("adsggh")
              ]),
               pw.Column(children: [
                pw.Text("Quantity", style: TextStyle(fontSize: 15 , fontWeight: pw.FontWeight.bold,color: PdfColors.blue)),
                pw.Text("1")
              ]), pw.Column(children: [
                pw.Text("Direction of intake", style: TextStyle(fontSize: 15 , fontWeight: pw.FontWeight.bold,color: PdfColors.blue)),
                pw.Text("asdgy")
              ])
            ]),
            pw.SizedBox(height: 40),
            pw.Text("OTHER INFORMATION"),
            pw.SizedBox(height: 10),

            pw.Text("iuytrdfhgjiuytrdfghvjkyutyrtdfghjiuytrfghjiuytrdcvbnjkhggdhjkjhgidhdhhduhdfhfddjhdionjdjndfiidjdkhedhediHGFTDTYHJYITUFJVHUIYUIJOKIOUYGTFRETYUIOPMNJJNJHGHGFRTFDRDRDFFCCFGGFHGHUYUIIUIOOIKOJKJKJHUYHYTRTFDFCFGCFGGFYUYHUJHNJNJBHJGH"),

            pw.SizedBox(height: 40),

pw.Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  pw.Text("Thank You for Trusting Us", style: pw.TextStyle(fontSize: 17 , fontWeight: pw.FontWeight.normal)),
  pw.Text("Dr.Anurag", style: pw.TextStyle(fontSize: 17 , fontWeight: pw.FontWeight.normal))
])
          ]
        );

      }
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(Map invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: BarcodeWidget(barcode: Barcode.qrCode(), data: 'hey'),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
