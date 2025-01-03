import 'package:haier_modules/view/haier_mall_invoice_pdf/style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceOrderDetail {
  static pw.Widget buildOrderDetail() {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // ignore: deprecated_member_use
          pw.Table.fromTextArray(
              cellPadding: const pw.EdgeInsets.only(top: 5, bottom: 5),
              headerPadding: const pw.EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              border: const pw.TableBorder(
                horizontalInside: pw.BorderSide(width: 0.5),
                top: pw.BorderSide(width: 0.5),
                bottom: pw.BorderSide(width: 0.5),
              ),
              headerStyle: const pw.TextStyle(
                fontSize: PdfStyles.subtitle,
                color: PdfColors.white,
              ),
              headerDecoration: pw.BoxDecoration(
                color: PdfStyles.tableHeader,
              ),
              cellStyle: const pw.TextStyle(
                fontSize: PdfStyles.body,
              ),
              cellAlignment: pw.Alignment.center,
              headerHeight: 35,
              cellHeight: 40,
              headers: [
                "Sr",
                "Description",
                "Qty",
                "Price",
                "Shipping Fee",
                "Discount",
                "Amount Paid"
              ],
              data: [
                [
                  "1",
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("H50KS00UX:(PAX)",
                            maxLines: 2,
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: PdfStyles.subtitle,
                            )),
                        pw.Text("Gold x HRF-438 - 16 Cu Ft/438 Liter",
                            maxLines: 2,
                            style: const pw.TextStyle(
                              fontSize: PdfStyles.small,
                            ))
                      ]),
                  "1",
                  "98,220",
                  "110",
                  "150",
                  pw.Text("98,480",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      )),
                ],
                [
                  "2",
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("HPU-48CE03/T-01:HPK/CAC/SET",
                            maxLines: 2,
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: PdfStyles.subtitle,
                            )),
                        pw.Text("Gold x HRF-438 - 16 Cu Ft/438 Liter",
                            maxLines: 2,
                            style: const pw.TextStyle(
                              fontSize: PdfStyles.small,
                            ))
                      ]),
                  "5",
                  "355,085",
                  "110",
                  "300",
                  pw.Text("355,395",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      )),
                ],
                [
                  "",
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Grand Total",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: PdfStyles.subtitle,
                            )),
                      ]),
                  "6",
                  "453,305",
                  "220",
                  "450",
                  pw.Text("1,598,480",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      )),
                ]
              ]),
        ]);
  }
}
