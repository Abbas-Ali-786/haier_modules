import 'package:haier_modules/view/haier_mall_invoice_pdf/style.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceInformation {
  static pw.Widget buildInvoiceInfo() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Invoice Information
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Text("Invoice From",
                    style: pw.TextStyle(
                      color: PdfStyles.greyText,
                      fontSize: PdfStyles.subtitle,
                    )),
                pw.Text("Haier Mall",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: PdfStyles.title)),
                pw.Text("Gulberg 2, Lahore",
                    style: const pw.TextStyle(fontSize: PdfStyles.subtitle)),
                pw.RichText(
                    text: pw.TextSpan(children: [
                  pw.TextSpan(
                      text: "Phone ",
                      style: pw.TextStyle(
                          color: PdfStyles.greyText,
                          fontSize: PdfStyles.subtitle)),
                  const pw.TextSpan(
                      text: "(042) 111 142 437",
                      style: pw.TextStyle(
                          color: PdfStyles.blackText,
                          fontSize: PdfStyles.body)),
                ])),
              ],
            ),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
              pw.Text("Total Amount",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: PdfStyles.subtitle)),
              pw.Text("Rs. 1,598,480",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: PdfStyles.title)),
            ]),
          ],
        ),
        pw.SizedBox(height: 20),

        // Order Information
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Text("Invoice To",
                    style: pw.TextStyle(
                        color: PdfStyles.greyText,
                        fontSize: PdfStyles.subtitle)),
                pw.Text("Chugtai Lab (Pvt.) LTD",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: PdfStyles.title)),
                pw.Text("7 - Jail Road Main Gulberg, Lahore",
                    style: const pw.TextStyle(fontSize: PdfStyles.subtitle)),
                pw.RichText(
                    text: pw.TextSpan(children: [
                  pw.TextSpan(
                      text: "Phone ",
                      style: pw.TextStyle(
                          color: PdfStyles.greyText,
                          fontSize: PdfStyles.subtitle)),
                  const pw.TextSpan(
                      text: "+92 300 6554 821 ",
                      style: pw.TextStyle(
                          color: PdfStyles.blackText,
                          fontSize: PdfStyles.body)),
                ])),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text("Order Number",
                    style: pw.TextStyle(
                        fontSize: PdfStyles.subtitle,
                        color: PdfStyles.greyText)),
                pw.Text("m4589652316"),
                pw.SizedBox(height: 4),
                pw.Text("Order Date",
                    style: pw.TextStyle(
                        fontSize: PdfStyles.subtitle,
                        color: PdfStyles.greyText)),
                pw.Text("24-08-2024"),
                pw.SizedBox(height: 4),
                pw.Text("Invoice Date",
                    style: pw.TextStyle(
                        fontSize: PdfStyles.subtitle,
                        color: PdfStyles.greyText)),
                pw.Text("24-08-2024"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
