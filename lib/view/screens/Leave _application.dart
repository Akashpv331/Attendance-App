import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/Dashboard_page.dart';
import 'package:ziya_inter_project/view/screens/Home_page.dart';
import 'package:ziya_inter_project/view/widget/Appbar_widget.dart';
import 'package:ziya_inter_project/view/widget/search_popup.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController filecontroller = TextEditingController();

  String? selectedLeaveOption;

  Future<void> pickfile() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
        );

        if (result != null && result.files.isNotEmpty) {
          setState(() {
            filecontroller.text = result.files.single.name;
          });
        }
      } catch (e) {
        debugPrint("File picking error: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permission denied. Please enable access.")),
      );
    }
  }

  @override
  void dispose() {
    employeeNameController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }

  Future<void> pickDate(TextEditingController controller) async {
    DateTime today = DateTime.now();
    DateTime firstSelectableDate = DateTime(today.year, today.month, today.day);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: firstSelectableDate,
      firstDate: firstSelectableDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }
  OverlayEntry? _popupOverlay;

void showTopPopup() {
  _popupOverlay = OverlayEntry(
    builder: (context) => PopupOverlayWidget(
      onClose: hideTopPopup,
    ),
  );

  Overlay.of(context).insert(_popupOverlay!);
}

void hideTopPopup() {
  _popupOverlay?.remove();
  _popupOverlay = null;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'leave application',onSearchTap:  showTopPopup,
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveDashboardPage()));
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.dashboard, color: Colors.blue),
                        SizedBox(width: 4),
                        Text("Dashboard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    )),
                const SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LeavePage()));
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_today_outlined, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("Request Leave",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Apply for Leave",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Employee Name"),
            const SizedBox(height: 6),
            customTextField(
              controller: employeeNameController,
              label: "Employee Name - auto-filled",
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            const Text("Employee ID"),
            const SizedBox(height: 6),
            customTextField(
              label: "Employee ID - auto-filled",
              prefixIcon: Icons.calendar_view_day_outlined,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("From"),
                      const SizedBox(height: 6),
                      customTextField(
                        controller: fromDateController,
                        label: "From Date",
                        prefixIcon: Icons.calendar_month_rounded,
                        onTap: () => pickDate(fromDateController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("To"),
                      const SizedBox(height: 6),
                      customTextField(
                        controller: toDateController,
                        label: "To Date",
                        prefixIcon: Icons.calendar_month_rounded,
                        onTap: () => pickDate(toDateController),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Leave Type"),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: customTextField(
                    label: "Leave type",
                    prefixIcon: Icons.calendar_month_rounded,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Material(
                    elevation: 2,
                    color: AppColors.white,
                    child: DropdownButtonFormField<String>(
                      value: selectedLeaveOption,
                      decoration: InputDecoration(
                        labelText: "Choose type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: [
                        "casual leave",
                        "sick leave",
                        "Work From Home",
                      ].map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLeaveOption = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Reason"),
            const SizedBox(height: 6),
            Material(
              elevation: 2,
              color: AppColors.white,
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Text area',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Attachment"),
            const SizedBox(height: 6),
            customTextField(
                controller: filecontroller,
                onTap: () async {
                  await Future.delayed(Duration(milliseconds: 100));
                  pickfile();
                },
                label: "Attachment (optional)"),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField({
    required String label,
    IconData? prefixIcon,
    IconData? suffix,
    TextEditingController? controller,
    VoidCallback? onTap,
  }) {
    return Material(
      elevation: 2,
      color: Colors.white,
      child: TextField(
        controller: controller,
        readOnly: onTap != null,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffix != null ? Icon(suffix) : null,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
