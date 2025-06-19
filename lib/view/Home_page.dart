import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ziya_inter_project/view/Leave%20_application.dart';
import 'package:ziya_inter_project/view/My_task.dart';
import 'package:ziya_inter_project/view/face_verification_onsite.dart';
import 'package:ziya_inter_project/view/face_verification_remote.dart';
import 'package:ziya_inter_project/view/on_going_page.dart';
import 'package:ziya_inter_project/view/summary_page.dart';
import 'package:ziya_inter_project/view/task_tracker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // overview widget
  Widget buildOverviewCard(String title, String subtitle, Color color) {
    return Expanded(
      child: Card(color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: color)),
              SizedBox(height: 6),
              Text(subtitle,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

// widget dashboard
  Widget buildDashboardItem(
      IconData icon, Color color, Color backgroundColor, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: backgroundColor,
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 5),
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //  Main container
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color.fromARGB(255, 167, 239, 119),Color(0xFF0A4D1F), ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            //  Left Avatar
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                'https://randomuser.me/api/portraits/men/32.jpg',
                              ),
                            ),
                            const SizedBox(width: 16),

                            //  Text Info
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Hemant Rangarajan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Full-stack Developer',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // logo overlap
                      Positioned(
                        right: -20,
                        top: 10,
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 2),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/logo_ziya.jpg"),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 9.4,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.lightBlue,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              SizedBox(height: 15),

              Text("Good Morning,\nHemant Rangarajan",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              SizedBox(height: 15),

              // Check-in / Check-out
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("You haven't checked-in yet",
                        style: TextStyle(color: Colors.red)),
                    SizedBox(height: 10),
                    Text(""),SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Check In Button
                        InkWell(
                          child: Container(
                            height: 40,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.rotate_right, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text("Punch In",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            // navigate faceverification screen
                            showPunchInDialog(context);
                          },
                        ),
                        // Check Out Button
                        InkWell(
                          child: Container(
                            height: 40,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.rotate_right,
                                      color: Colors.black54),
                                  SizedBox(width: 5),
                                  Text("Punch Out",
                                      style: TextStyle(color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            // function
                            showCheckoutDialog(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text("Overview",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),
              //  overview widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOverviewCard("Presence", "20", Colors.green),
                  buildOverviewCard("Absence", "03", Colors.red),
                  buildOverviewCard("Leaves", "02", Colors.orange),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Task Tabs
//             DefaultTabController(
//   length: 4,
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         margin: const EdgeInsets.all(12),
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: TabBar(
//           indicator: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelColor: Colors.white,
//           unselectedLabelColor: Colors.grey,
//           indicatorSize: TabBarIndicatorSize.tab,
//           tabs: const [
//             Tab(
//               icon: Icon(Icons.calendar_month),
//               text: "My Tasks",
//             ),
//             Tab(
//               icon: Icon(Icons.hourglass_empty),
//               text: "Task Tracker",
//             ),
//             Tab(
//               icon: Icon(Icons.rotate_right_outlined),
//               text: "Ongoing & Pending",
//             ),
//             Tab(
//               icon: Icon(Icons.work),
//               text: "Work Summary",
//             ),
//           ],
//         ),
//       ),

//       // Sort Row
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Text("Sort by: "),
//                 radioItem(true, "Deadline"),
//                 radioItem(false, "Project"),
//               ],
//             ),
//             const Icon(Icons.tune),
//           ],
//         ),
//       ),

//       // Tab Views
//       SizedBox(
//         height: 300,
//         child: TabBarView(
//           children: [
//             TaskPage(),
//             ExactTaskTrackerUI(),
//             OngoingTaskListScreen(),
//             SummaryScreen(),
//           ],
//         ),
//       ),
//     ],
//   ),
// )

DefaultTabController(
  length: 4,
  child: Column(
    children: [
      Container(height: 44,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          isScrollable: false, // You can set to true if text overflows
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month, size: 18),
                    SizedBox(width: 6),
                    Text("My Tasks", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.hourglass_empty, size: 18),
                    SizedBox(width: 6),
                    Text("Task Tracker", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.rotate_right_outlined, size: 18),
                    SizedBox(width: 6),
                    Text("Ongoing & \nPending Tasks", style: TextStyle(fontSize:26)),
                  ],
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.work, size: 18),
                    SizedBox(width: 6),
                    Text("Work Summary", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Sort Row
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text("Sort by: "),
                radioItem(true, "Deadline"),
                radioItem(false, "Project"),
              ],
            ),
            const Icon(Icons.tune),
          ],
        ),
      ),

      // Tab Views
      SizedBox(
        height: 300,
        child: TabBarView(
          children: [
            TaskPage(),
            ExactTaskTrackerUI(),
            OngoingTaskListScreen(),
            SummaryScreen(),
          ],
        ),
      ),
    ],
  ),
)
,
              SizedBox(height: 20),
              Text("Dashboard",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),
             

              LayoutBuilder(
  builder: (context, constraints) {
    double screenWidth = constraints.maxWidth;

    return GridView.count(
      crossAxisCount: 3, 
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: screenWidth > 600 ? 1.3 : 1, // Adjust card shape
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Card(color: Colors.white,
          child: buildDashboardItem(
            Icons.calendar_month_outlined,
            Colors.green,
            Colors.green[50]!,
            "Attendance",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LeavePage()),
            );
          },
          child: Card(color: Colors.white,
            child: buildDashboardItem(
              Icons.exit_to_app,
              Colors.orange,
              Colors.orange[100]!,
              "Leaves",
            ),
          ),
        ),
        Card(color: Colors.white,
          child: buildDashboardItem(
            Icons.pie_chart,
            Colors.deepPurple,
            Colors.purple[100]!,
            "Leave Status",
          ),
        ),
        Card(color: Colors.white,
          child: buildDashboardItem(
            Icons.calendar_today,
            Colors.blue,
            Colors.blue[100]!,
            "Holiday List",
          ),
        ),
        Card(color: Colors.white,
          child: buildDashboardItem(
            Icons.receipt_long,
            Colors.green,
            Colors.green[100]!,
            "Payslip",
          ),
        ),
        Card(color: Colors.white,
          child: buildDashboardItem(
            Icons.assessment,
            Colors.red,
            Colors.red[100]!,
            "Reports",
          ),
        ),
      ],
    );
  },
)

            ],
          ),
        ),
      ),
    );
  }

// sort widget
  Widget radioItem(bool selected, String label) {
    return Row(
      children: [
        Icon(
          selected ? Icons.radio_button_checked : Icons.radio_button_off,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(label),
        const SizedBox(width: 10),
      ],
    );
  }

  // alert box punchin

  void showPunchInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:
                          const Icon(Icons.close, size: 24, color: Colors.grey),
                    ),
                  ],
                ),
                const Text("Select Punch -In Type",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 20,),
                const Text("Are you working from home or on site today?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        // set value in shared
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('punchInType', 'onsite');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                Onsite_FaceverificationScreen(isCheckIn: true),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: const Center(child: Text("On Site")),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        // set value shared
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('punchInType', 'remote');
                        // navigate 
                        //remote face verification
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                FaceverificationScreen(isCheckIn: true),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: const Center(
                            child: Text("Work from Home",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // alert box punch out
  void showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:
                        const Icon(Icons.close, size: 24, color: Colors.grey),
                  ),
                ),
                const Icon(Icons.warning_amber_rounded,
                    color: Colors.orange, size: 50),
                const SizedBox(height: 10),
                const Text(
                  "Do you really want to\ncheckout!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.orange),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        // navigate  context (home)
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: const Center(child: Text("Update Task")),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          // get value shared
                          final prefs = await SharedPreferences.getInstance();
                          final punchInType = prefs.getString('punchInType');
                          if (punchInType == 'onsite') {
                            //true
                            // navigate  onsite face verification
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Onsite_FaceverificationScreen(
                                    isCheckIn: false),
                              ),
                            );
                          } else {
                            //false
                            // navigate remote face verification
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    FaceverificationScreen(isCheckIn: false),
                              ),
                            );
                          }
                          await prefs.clear();
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text("Check Out",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
