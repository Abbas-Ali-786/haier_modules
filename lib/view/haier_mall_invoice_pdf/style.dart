import 'package:pdf/pdf.dart';

class PdfStyles {
  // Colors
  static final PdfColor greyText = PdfColor.fromHex("909399");
  static final PdfColor tableHeader = PdfColor.fromHex("333333");
  static const PdfColor blackText = PdfColors.black;
  static final PdfColor primaryBlue = PdfColor.fromHex("0066CC");
  static final PdfColor lightGrey = PdfColor.fromHex("E5E5E5");
  static const PdfColor white = PdfColors.white;

  // Font Sizes
  static const double heading1 = 24.0;
  static const double heading2 = 20.0;
  static const double heading3 = 18.0;
  static const double title = 16.0;
  static const double subtitle = 14.0;
  static const double body = 12.0;
  static const double small = 10.0;
}
