import 'package:book_store/themes/theme.dart';
import 'package:book_store/utils/account_page.dart';
import 'package:book_store/views/home/book_details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  int navBarIndex = 0;
  bool purchased = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'WINS E-Library',
          style: CustomTheme.lightTheme().textTheme.headlineLarge,
        ),
        toolbarHeight: 80,
        bottom: navBarIndex == 0 ? PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  width: 280,
                  child: TabBar(
                      // padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      onTap: (value) {
                        index = value;
                        setState(() {
                          if(index == 0){
                            purchased = false;
                          }else{
                            purchased = true;
                          }
                        });
                      },
                      controller: tabController,
                      indicatorPadding:
                          EdgeInsets.only(bottom: 10, right: index == 0 ? 25.0 : 10.0, left: index == 0 ? 25.0 : 10.0),
                      indicatorColor: Colors.white,
                      tabs: const [
                        SizedBox(height: 30, child: Text('All Books')),
                        SizedBox(height: 30, child: Text('Purchased Tabs'))
                      ])),
            )) : null,
      ),
      body: navBarIndex == 0 ? SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(), controller: tabController, children: [
                /// ALL BOOKS
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 10, mainAxisExtent: 355),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookDetails(purchased: false),));
                      },child: bookTile());
                    },
                  ),
                ),
                /// PURCHASED BOOKS
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 10, mainAxisExtent: 335),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookDetails(purchased: true,),));
                      },child: bookTile());
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
      ) : accountPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.blue,fontSize: 14),
         unselectedLabelStyle: const TextStyle(color: Colors.black,fontSize: 14),
        currentIndex: navBarIndex,
        onTap: (value) {
          navBarIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Container(padding: const EdgeInsets.all(5),child: Image.asset(navBarIndex == 0 ? "assets/images/library_icon_selected.png" : "assets/images/library_icon.png")),label: 'E-library'),
          BottomNavigationBarItem(icon: Container(padding: const EdgeInsets.all(5),child: Image.asset(navBarIndex == 0 ?"assets/images/account_icon.png" : "assets/images/account_icon_selected.png")), label: 'Account')
        ],
      ),
    );
  }

  Widget bookTile(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 245,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage('assets/images/book 1.jpg'), fit: BoxFit.fill)),
        ),
        const SizedBox(height: 4,),
        Text(
          "The fragile balance of Terror",
          style: CustomTheme.lightTheme().textTheme.bodyMedium,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Narang and Scott D. Sagan',
          style: CustomTheme.lightTheme().textTheme.bodySmall,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 6,
        ),
        purchased ? Container() : Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90), border: Border.all(color: CustomColor.bookDetails)),
          child: Text("7,99 \u{20AC}",style: CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(fontSize: 17),),
        )
      ],
    );
  }
}
