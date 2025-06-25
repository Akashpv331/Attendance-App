// dashbord leave page

import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/Leave%20_application.dart';

class LeaveDashboardPage extends StatelessWidget {
  LeaveDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
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
              child: InkWell(
                child: Card(
                  elevation: 1,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: AppColors.black, size: 20),
                        SizedBox(width: 8),
                        Text("Search",
                            style: TextStyle(
                                color: AppColors.black, fontSize: 14)),
                      ],
                    ),
                  ),
                ),
                onTap: () {},
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
                child: IconButton(
                  iconSize: 18,
                  icon: const Icon(Icons.notifications,
                      color: AppColors.white, size: 16),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 2,
                right: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
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
                  // widget call
                  color: AppColors.white,
                  child: _buildInfoTile(
                    "Total Leave Taken",
                    "16 days",
                    "29 days remaining this year",
                    Icons.event_available,
                    extra: Row(
                      children: [
                        Expanded(
                          flex: 1, // 25%
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
                          flex: 3, // 75%
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
                Card(
                    color: AppColors.white,
                    child: _buildInfoTile(
                        "Approval Rate",
                        "92%",
                        "29 days remaining this year",
                        Icons.check_circle_outline)),
                Card(
                    color: AppColors.white,
                    child: _buildInfoTile("Pending Request", "1",
                        "25 days remaining", Icons.hourglass_empty)),
                Card(
                    color: AppColors.white,
                    child: _buildInfoTile("Team Member \n on Leave", "2",
                        "23 days remaining", Icons.group)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Expanded(
                            child: BarChartWidget(
                                label: "Q1", heightPercentage: 80)),
                        Expanded(
                            child: BarChartWidget(
                                label: "Q2", heightPercentage: 60)),
                        Expanded(
                            child: BarChartWidget(
                                label: "Q3", heightPercentage: 30)),
                        Expanded(
                            child: BarChartWidget(
                                label: "Q4", heightPercentage: 40)),
                      ],
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
// info widget

  Widget _buildInfoTile(
      String title, String value, String subtitle, IconData icon,
      {Widget? extra}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500)),
              ),
              Icon(icon, color: AppColors.blue, size: 18),
            ],
          ),
          const SizedBox(height: 10),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(subtitle,
              style: const TextStyle(fontSize: 11, color: AppColors.grey)),
          if (extra != null) ...[
            const SizedBox(height: 8),
            extra,
          ],
        ],
      ),
    );
  }
}

// chart widget
class BarChartWidget extends StatelessWidget {
  final String label;
  final double heightPercentage;
  final Color color;

  const BarChartWidget({
    super.key,
    required this.label,
    required this.heightPercentage,
    this.color = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = 100;
        final barHeight = (heightPercentage / 100) * maxHeight;
        final barWidth = constraints.maxWidth * 0.4;

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: barHeight,
              width: barWidth,
              decoration: BoxDecoration(
                color: color,
             
              ),
            ),
            const SizedBox(height: 6),
            Text(label,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        );
      },
    );
  }
}
