import 'package:flutter/material.dart';
import 'package:ziya_inter_project/view/Dashboard_page.dart';
import 'package:ziya_inter_project/view/Home_page.dart';

// leave page
class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  TextEditingController employeeNameController = TextEditingController();

  String? selectedLeaveOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 12,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/logo_ziya.jpg",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Card(
                elevation: 1,
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.black, size: 20),
                      SizedBox(width: 8),
                      Text("Search",
                          style: TextStyle(color: Colors.black, fontSize: 14))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: Colors.lightBlue,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                top: 2,
                right: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/32.jpg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    child: Row(
                      children: const [
                        Icon(Icons.dashboard, color: Colors.blue),
                        SizedBox(width: 4),
                        Text("Dashboard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaveDashboardPage(),
                          ));
                    },
                    splashColor: Colors.blue,
                    highlightColor: Colors.blue),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_today_outlined, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("Request Leave",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeavePage(),
                          ));
                    },
                    splashColor: Colors.blue,
                    highlightColor: Colors.blue),
              ],
            ),SizedBox(height: 10,),
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
                        label: "From Date",
                        prefixIcon: Icons.calendar_month_rounded,
                      )
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
                        label: "To Date",
                        prefixIcon: Icons.calendar_month_rounded,
                      )
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
                    color: Colors.white,
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
              color: Colors.white,
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Text area',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Attachment"),
            const SizedBox(height: 6),
            customTextField(label: "Attachment (optional)"),
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
                  //home
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
