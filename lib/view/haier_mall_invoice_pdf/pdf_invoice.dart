import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_invoice_pdf/invoice_information.dart';
import 'package:haier_modules/view/haier_mall_invoice_pdf/invoice_order_detail.dart';
import 'package:haier_modules/view/haier_mall_invoice_pdf/style.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PDFInvoice extends StatelessWidget {
  PDFInvoice({this.title = "Invoice", super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0XFFE5E5E5),
            height: 1.0,
          ),
        ),
      ),
      body: PdfPreview(
        build: (PdfPageFormat format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();
    final haierLogo =
        await imageFromAssetBundle("assets/dailyCheckIn/Haier_logo.png");
    final invoiceLogo =
        await imageFromAssetBundle("assets/dailyCheckIn/Invoice.png");

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Stack(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(16.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Header
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(haierLogo, width: 120, height: 120),
                        pw.Image(invoiceLogo, width: 120, height: 120),
                      ],
                    ),
                    pw.SizedBox(height: 20),

                    // Invoice Information
                    InvoiceInformation.buildInvoiceInfo(),
                    pw.SizedBox(height: 18),

                    // Invoice Order Detail
                    InvoiceOrderDetail.buildOrderDetail(),
                    pw.SizedBox(height: 20),

                    // Amount in Words
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "Rupees: ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          const pw.TextSpan(
                            text:
                                "One Million Five Hundred And Ninety Thousand Only",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.Positioned(
                bottom: 7,
                left: 0,
                right: 0,
                child: pw.Center(
                  child: pw.Text(
                      "This is a system generated invoice and does not require any stamp & signature.",
                      style: const pw.TextStyle(
                          fontSize: PdfStyles.small,
                          color: PdfStyles.blackText)),
                ),
              ),
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
