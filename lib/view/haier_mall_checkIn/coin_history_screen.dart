import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinHistoryScreen extends StatefulWidget {
  const CoinHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CoinHistoryScreen> createState() => _CoinHistoryScreenState();
}

class _CoinHistoryScreenState extends State<CoinHistoryScreen> {
  String selectedTab = 'Earned';
  Map<String, List<String>> data = {
    'Earned': ['Placed Order', 'Check-in', 'Refund'],
    'Used': ['Placed Order', 'Rs.1 Activity'],
    'Expired': ['Check-in', 'Placed Order'],
  };
  Map<String, List<String>> months = {
    'Oct': ['Placed Order', 'Check-in', 'Check-in', 'Refund'],
    'Sep': ['Check-in', 'Placed Order'],
    'Aug': ['Placed Order', 'Refund'],
    'July': ['Check-in'],
  };

  // Calendar related variables
  String selectedDate = 'MM/YY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Coin History',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 247, 247, 247),
          ),
          child: Column(
            children: [
              // Banner Section
              Container(
                padding: const EdgeInsets.all(16),
                color: const Color(0XFF0159A1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Coin Balance',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Text(
                              '2900',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              "assets/dailyCheckIn/coin.png",
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Flexible(
                      child: Image.asset(
                        "assets/dailyCheckIn/invisible_coins.png",
                        color: const Color(0XFFE6EEF6),
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              // Calendar Picker Section
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 0, right: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Transaction',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            selectedDate =
                                DateFormat('MM/yy').format(pickedDate);
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFDCDFE6)),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              selectedDate,
                              style: const TextStyle(color: Color(0XFFA8ABB2)),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.15),
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 15,
                              color: Color(0XFFA8ABB2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Three Buttons Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTabButton('Earned'),
                    const SizedBox(width: 2),
                    buildTabButton('Used'),
                    const SizedBox(width: 2),
                    buildTabButton('Expired'),
                  ],
                ),
              ),

              // Dropdown Section
              Expanded(
                child: ListView.builder(
                  itemCount: months.length,
                  itemBuilder: (context, index) {
                    String month = months.keys.elementAt(index);
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ExpansionTile(
                        title: Text(month),
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                            ),
                          ),
                          Column(
                            children: months[month]!.map((item) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(item,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text(
                                        'Expires on 27 Dec, 2024',
                                        style: TextStyle(fontSize: 12)),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          selectedTab == 'Earned'
                                              ? '+25'
                                              : selectedTab == 'Used'
                                                  ? '-25'
                                                  : '00',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Image.asset(
                                            'assets/dailyCheckIn/coin.png',
                                            width: 15,
                                            height: 15),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, right: 16),
                                    child: Divider(
                                      height: 1,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
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
    );
  }

  Widget buildTabButton(String tab) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedTab = tab;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        disabledBackgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedTab == tab
                  ? const Color(0xFF0159A1)
                  : const Color(0XFF909399),
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          tab,
          style: TextStyle(
            color: selectedTab == tab
                ? const Color(0xFF0159A1)
                : const Color(0XFF909399),
          ),
        ),
      ),
    );
  }
}
