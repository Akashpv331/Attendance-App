import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ziya_inter_project/view/widget/Appbar_widget.dart';

class PayslipScreen extends StatefulWidget {
  PayslipScreen({super.key});

  @override
  State<PayslipScreen> createState() => _PayslipScreenState();
}

class _PayslipScreenState extends State<PayslipScreen> {
  final GlobalKey repaintKey = GlobalKey();
  String selectedMonth = "June 2025";

  @override
  void initState() {
    super.initState();
    loadSelectedMonth();
  }

  Future<void> loadSelectedMonth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? month = prefs.getString('selectedMonth');
    if (month != null) {
      setState(() {
        selectedMonth = month;
      });
    }
  }

  Future<void> saveSelectedMonth(String month) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedMonth', month);
  }

  Future<void> onDownloadTap(String month) async {
    await saveSelectedMonth(month);
    setState(() {
      selectedMonth = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
          title: 'Report',
          onSearchTap: () => "",
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepaintBoundary(
              key: repaintKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 23,
                    width: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new, color: Colors.black),
                        Text("Payslip")
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/logo_ziya.jpg', height: 40),
                      Column(
                        children: const [
                          Text('ZiyaAcademy',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue)),
                          Text('KEY TO SUCCESS',
                              style: TextStyle(
                                  color: AppColors.green, fontSize: 12)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Payslip for the Month',
                              style: TextStyle(fontSize: 12)),
                          Text(selectedMonth,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 32),
                  Text("EMPLOYEE SUMMARY",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            infoRowemp('Employee Name', ':Hemant Rangarajan'),
                            infoRowemp('Designation', ':Full-stack Developer'),
                            infoRowemp('Employee ID', ':Employee ID'),
                            infoRowemp('Date of Joining', ':30/05/2025'),
                            infoRowemp('Pay Period', ':June 2025'),
                            infoRowemp('Pay Date', ':15/07/2025'),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey, width: .5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 12,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: .2, color: AppColors.grey),
                                color:
                                    const ui.Color.fromARGB(255, 229, 245, 208),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    width: 2,
                                    color: AppColors.green,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: const [
                                      Text('₹45,000',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text('Employee Net Pay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('Paid Days',
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 10)),
                                Text("31",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 10))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('LOP Days',
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 10)),
                                Text("0",
                                    style: TextStyle(
                                        color: AppColors.grey, fontSize: 10))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'PF A/C Number : ',
                          style: TextStyle(fontSize: 12)),
                      TextSpan(
                          text: 'AA/AAA/999999/99a/9899   ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      TextSpan(text: 'UAN : ', style: TextStyle(fontSize: 12)),
                      TextSpan(
                          text: '1111111111',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.greyText.withOpacity(
                                0.0,
                              ),
                              blurRadius: 4,
                              offset: Offset(4, 4)),
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/logo_ziya.jpg"),
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.2),
                            BlendMode.dstATop,
                          ),
                        )),
                    child: Column(
                      children: [
                        tableRow(true, 'EARNINGS', 'AMOUNT', 'YTD',
                            'DEDUCTIONS', 'AMOUNT', 'YTD'),
                        tableRow(false, 'Basic', '₹25,000', '₹3,00,000',
                            'PF Deduction', '₹2,500', '₹30,000'),
                        tableRow(false, 'HRA', '₹10,000', '₹1,20,000',
                            'Tax Deduction', '₹7,500', '₹90,000'),
                        tableRow(false, 'Travel Allowance', '₹3,000', '₹36,000',
                            '', '', ''),
                        tableRow(false, 'Meal / Other Allowance', '₹2,000',
                            '₹24,000', '', '', ''),
                        Container(
                          color: AppColors.blue.shade50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Gross Earnings = ₹55,000',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Total Deductions = ₹10,000',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: AppColors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                            'Total Net Payable\nGross Earnings - Total Deductions',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        Text('₹45,000',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                          "Amount in Words: Indian Rupee Forty-Five Thousand Only",
                          style: TextStyle(fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "-This document has been automatically generated by Ziya Academy",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: Colors.blue.shade400,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14)),
                onPressed: () async {
                  RenderRepaintBoundary boundary = repaintKey.currentContext!
                      .findRenderObject() as RenderRepaintBoundary;
                  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                  ByteData? byteData =
                      await image.toByteData(format: ui.ImageByteFormat.png);
                  Uint8List pngBytes = byteData!.buffer.asUint8List();

                  final pdf = pw.Document();
                  final imageProvider = pw.MemoryImage(pngBytes);

                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Center(child: pw.Image(imageProvider));
                      }));

                  await Printing.layoutPdf(
                      onLayout: (PdfPageFormat format) async => pdf.save());
                },
                child: const Text(
                  'Download the sample salary slip format for PDF',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Monthly Payslip History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildHistoryRow(
                    month: "Month",
                    netPay: "Net Pay",
                    status: "Status",
                    action: "Action",
                    isHeader: true,
                  ),
                  buildHistoryRow(
                    month: "May 2025",
                    netPay: "₹45,000",
                    onDownloadTap: () async {
                      await saveSelectedMonth("May 2025");
                      setState(() => selectedMonth = "May 2025");
                    },
                  ),
                  buildHistoryRow(
                    month: "April 2025",
                    netPay: "₹43,500",
                    onDownloadTap: () async {
                      await saveSelectedMonth("April 2025");
                      setState(() => selectedMonth = "April 2025");
                    },
                  ),
                  buildHistoryRow(
                    month: "March 2025",
                    netPay: "₹41,000",
                    onDownloadTap: () async {
                      await saveSelectedMonth("March 2025");
                      setState(() => selectedMonth = "March 2025");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRowemp(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text("$label", style: const TextStyle(fontSize: 12))),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget tableRow(bool isHeader, String eTitle, String eAmt, String eYtd,
      String dTitle, String dAmt, String dYtd) {
    final style = TextStyle(
        fontSize: 10,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          Expanded(child: Text(eTitle, style: style)),
          const SizedBox(width: 8),
          Text(eAmt, style: style),
          const SizedBox(width: 8),
          Text(eYtd, style: style),
          const Spacer(),
          Expanded(child: Text(dTitle, style: style)),
          const SizedBox(width: 8),
          Text(dAmt, style: style),
          const SizedBox(width: 8),
          Text(dYtd, style: style),
        ],
      ),
    );
  }

  Widget buildHistoryRow({
    required String month,
    required String netPay,
    String? status,
    String? action,
    bool isHeader = false,
    VoidCallback? onDownloadTap,
  }) {
    final bool isDownloaded = selectedMonth == month;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              month,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              netPay,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: isHeader
                ? Text(
                    status ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Row(
                    children: [
                      Icon(
                        isDownloaded ? Icons.check_circle : Icons.check_circle,
                        color: isDownloaded ? AppColors.green : AppColors.blue,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isDownloaded ? "Genereted" : "Genereted",
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
          ),
          Expanded(
            flex: 2,
            child: isHeader
                ? Text(
                    action ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : GestureDetector(
                    onTap: isDownloaded ? null : onDownloadTap,
                    child: Row(
                      children: [
                        Icon(
                          isDownloaded ? Icons.check_circle : Icons.download,
                          color:
                              isDownloaded ? AppColors.green : AppColors.blue,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isDownloaded ? "Downloaded" : "Download",
                          style: TextStyle(
                            fontSize: 10,
                            color:
                                isDownloaded ? AppColors.green : AppColors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
