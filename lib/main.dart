import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as SVG;
import 'package:pavillionrewards/constants/colors.dart';
import 'package:pavillionrewards/constants/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavillionrewards/screens/cards_page.dart';
import 'package:pavillionrewards/screens/payment_page.dart';
import 'package:pavillionrewards/screens/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = true;
  int currentIndex = 0;
  final screens = [
    const MyHomePage(),
    const PaymentPage(),
    const CardsPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 8,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Container(
                height: 220,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                child: Image.asset(
                                  'assets/images/profile_pic.png',
                                ),
                              ),
                              const Text(
                                '  Hi Janet,',
                                style: kHeadingTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/search.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/help_circle.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/bell.svg',
                                  height: 25,
                                  width: 25,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBalanceTiles(
                            assetName: 'assets/images/wallet.svg',
                            title: 'Wallet Balance',
                            amount: 'N3,242',
                          ),
                          buildBalanceTiles(
                            assetName: 'assets/images/rewards.svg',
                            title: 'Reward Balance',
                            amount: 'N3,242',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Congratulations!!',
                                style: kBodyTextStyle,
                              ),
                              RichText(
                                overflow: TextOverflow.clip,
                                text: const TextSpan(
                                  text:
                                      "You've completed all your tasks for the week and you won ",
                                  style: kRichTextStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '150 points',
                                        style: kRichTextStyle2)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 115,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Redeem Now!',
                                      style: kXSTextStyle.copyWith(
                                          color: Colors.black87),
                                    )),
                              )
                            ],
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/rewards.svg',
                          //   // height: 25,
                          //   // width: 25,
                          // ),
                          Image.asset('assets/images/treasure.png'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Container(
                          //   height: 180,
                          //   width: 350,
                          //   decoration: const BoxDecoration(
                          //     image: DecorationImage(
                          //       image: SVG.Svg(
                          //         'assets/images/virtual_card.svg',
                          //       ),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          buildVirtualCard(),
                          buildVirtualCard(),
                          // Card(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Container(
                          //     height: 200,
                          //     width: 400,
                          //     decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(
                          //           'assets/images/virtual_card.jpg',
                          //         ),
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transaction History',
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                '  This Month',
                                style: kSButtonTextStyle,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '  Name',
                          style: kSubTitleTextStyle,
                        ),
                        SizedBox(
                          width: 115,
                        ),
                        Text('Date', style: kSubTitleTextStyle),
                        SizedBox(
                          width: 60,
                        ),
                        Text('  Time', style: kSubTitleTextStyle),
                        SizedBox(
                          width: 50,
                        ),
                        Text('Points', style: kSubTitleTextStyle),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            index == 0
                                ? 'assets/icons/green_gift.svg'
                                : 'assets/icons/gift_red.svg',
                            height: 40,
                            width: 40,
                          ),
                          title: Row(
                            children: [
                              Text(
                                'SuperMart',
                                style: kBodyTextStyle.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                '    12/06/2022',
                                style: kDateTimeTextStyle,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Text(
                                '12:34',
                                style: kDateTimeTextStyle,
                              ),
                            ],
                          ),
                          trailing: Text(
                            index == 0 ? '+50points' : '-50points',
                            style: TextStyle(
                              color: index == 0 ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: kPrimaryColor,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          showSelectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                //color: currentIndex == 0 ? kPrimaryColor : Colors.grey,

                //width: 230,
                //height: 235,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/card_holder.svg',
                //color: currentIndex == 1 ? kPrimaryColor : Colors.grey,

                //width: 230,
                //height: 235,
              ),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/credit_card.svg',
                //color: currentIndex == 2 ? kPrimaryColor : Colors.grey,

                //width: 230,
                //height: 235,
              ),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                color: currentIndex == 3 ? kPrimaryColor : Colors.grey,

                //width: 230,
                //height: 235,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Card buildVirtualCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        width: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: SVG.Svg(
            //   'assets/images/virtual_card.svg',
            // ),
            image: AssetImage(
              'assets/images/virtual_card.jpg',
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Container buildBalanceTiles({
    required String assetName,
    required String title,
    required String amount,
  }) {
    return Container(
      height: 80,
      width: 180,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          assetName,
          height: 45,
          width: 45,
        ),
        title: Text(
          title,
          style: kSBodyTextStyle,
        ),
        subtitle: Text(
          amount,
          style: kSubtitleTextStyle2.copyWith(color: Colors.white),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/icons/eye-off.svg',
              // height: 25,
              // width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
