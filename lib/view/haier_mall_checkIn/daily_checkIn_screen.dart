import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_checkIn/daily_mission_dialog.dart';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() => _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  DateTime getCurrentWeekStart() {
    DateTime now = DateTime.now();
    return now.subtract(Duration(days: now.weekday - 1));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth > 600 ? 600 : screenWidth;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Daily Check-in',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 247, 247),
          ),
          width: containerWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    // padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xFF0159A1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: screenHeight * 0.005),
                                    Image.asset(
                                      "assets/dailyCheckIn/coin.png",
                                      height: 14,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: screenHeight * 0.005),
                                    const Text('0 coins',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                  ],
                                ),
                                const Icon(Icons.chevron_right,
                                    color: Colors.white, size: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.012),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text('Daily Check-in',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(height: screenHeight * 0.0001),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text('Check-in daily to get rewards.',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF909399))),
                        ),
                        SizedBox(height: screenHeight * 0.020),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 14.0, right: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: const Color(0XFFFAECD8),
                                      boxShadow: [
                                        BoxShadow(
                                          // ignore: deprecated_member_use
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          // ignore: deprecated_member_use
                                          color: Colors.grey.withOpacity(0.05)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/dailyCheckIn/coin.png',
                                            height: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          child: Center(
                                            child: Text('${20 + index * 5}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.002),
                                  Text(
                                      getCurrentWeekStart()
                                                  .add(Duration(days: index))
                                                  .day ==
                                              DateTime.now().day
                                          ? 'Today'
                                          : '${getCurrentWeekStart().add(Duration(days: index)).day} ${getCurrentWeekStart().add(Duration(days: index)).toString().split(' ')[0].split('-')[1] == '12' ? 'Dec' : 'Jan'}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400))
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                ShowTodayMissionDialog.showTodayMissionDialog(
                                    context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                'Check-in & Get 25 coins',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.010),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Summer Savings',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: screenHeight * 0.010),
                // Item List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                'https://www.lifewire.com/thmb/Xmij3UZ9EuKASXFqX4hsdPj-0WY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/LG-22-28-LG4540-LED-LCD-TV-AMZN-xxx-58ceff565f9b581d726af2ca.jpg',
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Candy By Haier 32 Android Smart LED TV',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      ...List.generate(
                                        5,
                                        (i) => const Icon(Icons.star,
                                            color: Colors.amber, size: 14),
                                      ),
                                      const Text(
                                        ' (4.8/5)',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  const Text(
                                    'Rs. 44,899',
                                    style: TextStyle(
                                        color: Color(0XFF0159A1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Rs. 65,000',
                                    style: TextStyle(
                                      color: Color(0XFF828282),
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: containerWidth,
        color: Colors.black,
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.category), text: 'Category'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Cart'),
            Tab(icon: Icon(Icons.person), text: 'Account'),
          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }
}
