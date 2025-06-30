

import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/screens/Leave%20_application.dart';
import 'package:ziya_inter_project/view/widget/Appbar_widget.dart';
import 'package:ziya_inter_project/view/widget/Barchart_widget.dart';
import 'package:ziya_inter_project/view/widget/Info_widget.dart';

class LeaveDashboardPage extends StatelessWidget {
  LeaveDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
 
       appBar:  CustomAppBar(title: 'Dashboard',onSearchTap: () => "",),
    
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.dashboard,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 4),
                    Text("Dashboard",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue)),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeavePage(),
                          ));
                    },
                    splashColor: Colors.blue,
                    highlightColor: Colors.blue,
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_today_outlined,
                            color: AppColors.grey),
                        SizedBox(width: 4),
                        Text("Request Leave",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey)),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1.2,
              children: [
                Card(
                  color: AppColors.white,
                  child: InfoTile(
                    title: "Total Leave Taken",
                    value: "16 days",
                    subtitle: "29 days remaining this year",
                    icon: Icons.event_available,
                    extra: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(2),
                                bottomLeft: Radius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 192, 215, 233),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 170, 198, 227)),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Card(
                  color: AppColors.white,
                  child: InfoTile(
                    title: "Approval Rate",
                    value: "92%",
                    subtitle: "29 days remaining this year",
                    icon: Icons.check_circle_outline,
                  ),
                ),
                const Card(
                  color: AppColors.white,
                  child: InfoTile(
                    title: "Pending Request",
                    value: "1",
                    subtitle: "25 days remaining",
                    icon: Icons.hourglass_empty,
                  ),
                ),
                const Card(
                  color: AppColors.white,
                  child: InfoTile(
                    title: "Team Member \n on Leave",
                    value: "2",
                    subtitle: "23 days remaining",
                    icon: Icons.group,
                  ),
                ),
              ],
            ),
            Card(
              color: AppColors.white,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Leave Overview",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              "Your leave distribution for the current year"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            BarChartWidget(label: "Q1", heightPercentage: 20),
                            BarChartWidget(label: "Q2", heightPercentage: 15),
                            BarChartWidget(label: "Q3", heightPercentage: 10),
                            BarChartWidget(label: "Q4", heightPercentage: 10),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Leave days taken",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 1,
              color: AppColors.white,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total days:"),
                        Text("20"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Remaining:"),
                        Text("29"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: AppColors.white,
              elevation: 2,
              child: Padding(
                padding: AppPadding.small,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Upcoming Leave",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Your scheduled time off"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Annual Leave"),
                              Container(
                                height: MediaQuery.of(context).size.height / 26,
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                alignment: Alignment.center,
                                child: const Text("Pending"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("April 22, 2025 to Apr 24, 2025 (3 days)"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: const Color.fromARGB(255, 249, 246, 232),
                      child: Row(
                        children: [
                          Icon(
                            Icons.pending_outlined,
                            color: AppColors.amber,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Pending Approval",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(
                                    "Your leave request is awaiting manager approval."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
