import 'package:flutter/material.dart';

class ShowTodayMissionDialog extends StatelessWidget {
  const ShowTodayMissionDialog({super.key});

  static void showTodayMissionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.53,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFF4798FE),
                    Color(0XFF4CEFF8),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          ..._buildMissionCards(context),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/dailyCheckIn/mission_badge.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width - 50,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                    weight: 1500,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static List<Widget> _buildMissionCards(BuildContext context) {
    List<Map<String, String>> missions = [
      {
        'title': 'Add items to cart',
        'description': 'Add any 2 items to cart and earn 25 coins',
      },
      {
        'title': 'Make a purchase',
        'description': 'Buy a product and get 25 coins',
      },
      {
        'title': 'Search a keyword',
        'description': 'Earn extra discount',
      },
      {
        'title': 'Rs.1 Activity',
        'description': 'Join and earn coins',
      },
    ];

    return missions.map((mission) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.white,
                width: 3,
              )),
          color: const Color(0XFF00ACFF),
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                title: Stack(
                  children: [
                    // Black border text
                    Text(
                      mission['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    // White text
                    Text(
                      mission['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  mission['description']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Text(
                          '+25',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Colors.white,
                          ),
                        ),
                        const Text(
                          '+25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Image.asset('assets/dailyCheckIn/coin_collection.png',
                        width: 40, height: 40),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.01,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            color: const Color(0XFF0075C9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              // Progress fill
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.2) *
                                        0.7, // 70% progress
                                decoration: BoxDecoration(
                                  color: const Color(0XFFFFC700),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text("0/1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.30),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.032,
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      gradient: missions.indexOf(mission) >= 2
                          ? const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0XFFBEB9C3),
                                Color(0XFFBEB9C3),
                                Color(0XFFD1D1D1),
                                Color(0XFFD1D1D1),
                              ],
                              stops: [0.5, 0.5, 0.5, 0.5],
                            )
                          : const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0XFF0054A6),
                                Color(0XFF0054A6),
                                Color(0XFF0097EC),
                                Color(0XFF0097EC),
                              ],
                              stops: [0.5, 0.5, 0.5, 0.5],
                            ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: ElevatedButton(
                        onPressed:
                            missions.indexOf(mission) >= 2 ? null : () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: const Size(30, 30),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Stroke text for ultra bold effect
                            Text(
                              missions.indexOf(mission) == 0
                                  ? 'Go'
                                  : missions.indexOf(mission) == 1
                                      ? 'Claim'
                                      : 'Completed',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = missions.indexOf(mission) >= 2
                                      ? const Color(0XFF868287)
                                      : Colors.white,
                              ),
                            ),
                            // Main text
                            Text(
                              missions.indexOf(mission) == 0
                                  ? 'Go'
                                  : missions.indexOf(mission) == 1
                                      ? 'Claim'
                                      : 'Completed',
                              style: TextStyle(
                                color: missions.indexOf(mission) >= 2
                                    ? const Color(0XFF868287)
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
