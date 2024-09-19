import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_fawery_localization/lang/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
// with SingleTickerProviderStateMixin
{
  bool lang = false;
  int visit = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
      print(_currentPage);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  // late TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 3, vsync: this);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (lang == false) {
            setState(() {
              lang = true;
            });
            await context.setLocale(const Locale('ar'));
          } else {
            setState(() {
              lang = false;
            });
            await context.setLocale(const Locale('en'));
          }
        },
        child: const Icon(
          Icons.language,
        ),
      ),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(
              Icons.messenger_outline_sharp,
              size: 25,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          LocaleKeys.titleAppBar.tr(),
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 8, 52, 88),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.card_giftcard,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        LocaleKeys.giftDrawer.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: Text(LocaleKeys.settingDrawer.tr()),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
              ),
              title: Text(LocaleKeys.helpDrawer.tr()),
            ),
            ListTile(
              leading: const Icon(
                Icons.lightbulb_outlined,
              ),
              title: Text(LocaleKeys.suggestDrawer.tr()),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
              ),
              title: Text(LocaleKeys.privacyDrawer.tr()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline_rounded,
              ),
              title: Text(LocaleKeys.aboutDrawer.tr()),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(items: []) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BottomBarInspiredOutside(
              //   items: [
              //     TabItem(icon: Icon(Icons.search), title: 'search'),
              //   ],
              //   backgroundColor: Color(0XFF1752FE),
              //   color: Color(0XFF96B1FD),
              //   colorSelected: Colors.white,
              //   indexSelected: visit,
              //   onTap: (int index) => setState(() {
              //     visit = index;
              //   }),
              //   top: -25,
              //   animated: true,
              //   // itemStyle: ItemStyle.hexagon,
              //   chipStyle: const ChipStyle(drawHexagon: true),
              // ),
              // TabBar(
              //   controller: _tabController,
              //   tabs: [
              //     Tab(text: 'Tab 1'),
              //     Tab(text: 'Tab 2'),
              //     Tab(text: 'Tab 3'),
              //   ],
              // ),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  title: Text(
                    LocaleKeys.searchBody.tr(),
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.payment),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(LocaleKeys.titleFirst.tr()),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.note_outlined),
                        SizedBox(
                          width: 15,
                        ),
                        Text(LocaleKeys.titleSecond.tr())
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.titleCOne.tr()),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(LocaleKeys.titleTwo.tr()),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(LocaleKeys.titleThree.tr()),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(LocaleKeys.titleFour.tr()),
                    ],
                  ),
                  // TabBarView(
                  //   controller: _tabController,
                  //   children: [
                  //   Container(
                  //     color: Colors.red,
                  //     child: Center(child: Text('Content for Tab 1')),
                  //   ),
                  //   Container(
                  //     color: Colors.green,
                  //     child: Center(child: Text('Content for Tab 2')),
                  //   ),
                  //   Container(
                  //     color: Colors.blue,
                  //     child: Center(child: Text('Content for Tab 3')),
                  //   ),
                  // ]),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              // list view.builder
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.titleCOne.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              LocaleKeys.titleCTwo.tr(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.sp,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 18, 84, 138),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                child: Text(
                                  LocaleKeys.titleCThree.tr(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              AssetImage('assets/images/images.jpeg'),
                        ),
                        // Image.asset(
                        //   'assets/images.jpeg',
                        //   width: 50,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 50.h,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.firstTitle.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleOneM.tr(),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleTwoM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleThreeM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleFourM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleFiveM.tr(),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleSixM.tr(),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleSevenM.tr(),
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleEightM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleNineM.tr(),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleTenM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.phonelink_ring),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                LocaleKeys.titleElevenM.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                LocaleKeys.titleSeeFixed.tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 200.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: PageView(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    // scrollBehavior: ScrollBehavior(),
                    // scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius here
                        child: Image.asset(
                          'assets/images/first.jpeg', // Replace with your image asset
                          width: 300.w, // Set a width
                          height: 200.h, // Set a height
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius here
                        child: Image.asset(
                          'assets/images/second.jpeg', // Replace with your image asset
                          width: 300.w, // Set a width
                          height: 200.h, // Set a height
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the radius here
                        child: Image.asset(
                          'assets/images/third.jpeg', // Replace with your image asset
                          width: 300.w, // Set a width
                          height: 200.h, // Set a height
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3, // Total number of pages
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.secondTitle.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      LocaleKeys.titleSeeFixed.tr(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              //
              SizedBox(
                height: 300.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/third.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleOneC.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Happy Vision'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/second.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleTwoCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Delsey'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/first.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleThreeCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Kimbo'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/third.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleThreeCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Abu Auf'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/second.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleTwoCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Cortefiel'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/first.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleTwoCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Springfield'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius here
                                child: Image.asset(
                                  'assets/images/third.jpeg', // Replace with your image asset
                                  width: 300.w, // Set a width
                                  height: 150.h, // Set a height
                                  fit: BoxFit.fill, // Adjust the fit as needed
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleThreeCFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('DUKES'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    LocaleKeys.titleFixed.tr(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, right: 32, left: 32),
        child: BottomBarFloating(
          borderRadius: BorderRadius.circular(70),
          items: [
            TabItem(
              icon: Icons.home_rounded,
              title: LocaleKeys.titleAppBar.tr(),
            ),
            TabItem(
              icon: Icons.wallet,
              title: LocaleKeys.titleNavigateTwo.tr(),
            ),
            TabItem(
              icon: Icons.store_mall_directory_sharp,
              title: LocaleKeys.titleNavigateThree.tr(),
            ),
            TabItem(
              icon: Icons.more_horiz,
              title: LocaleKeys.titleNavigateFour.tr(),
            ),
          ],
          backgroundColor: Colors.white,
          color: Colors.black,
          colorSelected: const Color.fromARGB(255, 23, 89, 143),
          indexSelected: visit,
          paddingVertical: 24,
          onTap: (int index) => setState(() {
            visit = index;
          }),
        ),
      ),
    );
  }
}
