import 'package:apparel/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../components/conmponents.dart';
import '../data/data.dart';
import 'categories/Categories.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;


  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;


  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },

      ),
      request: AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/userimage_1.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                //جمب الصورة هحط الاسم مثلا هيكون داخل اكسباند
                Expanded(
                    child: ListTile(
                  title: Text(
                    "Hisham",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "hesham152@gmail.com",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.account_circle),
            onTap: () {},
          ),
          ListTile(
            title: Text("Language"),
            leading: Icon(Icons.language),
            onTap: () {},
          ),
          ListTile(
            title: Text("Setting"),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: Text("follow app"),
            leading: Icon(Icons.add_reaction),
            onTap: () {},
          ),
          ListTile(
            title: Text("More App"),
            leading: Icon(Icons.app_shortcut),
            onTap: () {},
          ),
          ListTile(
            title: Text("support"),
            leading: Icon(Icons.support),
            onTap: () {},
          ),
          ListTile(
            title: Text("App Info"),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          ListTile(
            title: Text("SignOut"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {},
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            //padding: EdgeInsets.all(50),
            child: Text(
              " Ver 1.0.0",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ]),
      ),
      appBar: AppBar(
        title: Text("Apparel"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(Icons.notifications_none, size: 24),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  ),
                  height: 12,
                  width: 12,
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TextFormField for search box
            Container(
              height: 100,
              child: TextFormField(
                //black backgroundColor

                decoration: InputDecoration(
                  //TextFormField box size

                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  prefixIcon: Icon(Icons.search, color: Colors.black45),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  //black backgroundColor
                  filled: true,
                  fillColor: Colors.grey.shade200,

                  hintText: "Search for tshirts, jeans, shorts, jackets",
                ),
                //ظهور صفحة البحث عند الضغط علي التيكست فيلد
                onTap: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
              ),
            ),

            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    //slider Banner
                    CarouselSlider(
                        items: [
                          ...List.generate(
                            sliderBannerItems.length,
                            (index) {
                              return GestureDetector(
                                child: sliderBannerItems[index],
                                onTap: () {
                                  
                                PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: Categories(data:sliderBannerItems[index].itemKey ,color:sliderBannerItems[index].containercolor ,),
                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation: PageTransitionAnimation.scaleRotate,

                              );
                                },
                              );
                            },
                          ),
                        ],
                        options: CarouselOptions(
                          viewportFraction: .9,
                          height: 230,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )),
                    if(_isBannerAdReady)
                      Container(
                        height: _bannerAd.size.height.toDouble(),
                        width: _bannerAd.size.width.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      ),
                    SizedBox(height: 15),
                    //recommended and see all text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    //recommended products
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              child: Column(children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                        info: productsandprice[
                                                            index],
                                                      )));
                                        },
                                        child: productsandprice[index],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 30,
                                      );
                                    },
                                    itemCount: 2)
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Column(children: [
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                          info:
                                                              products[index])),
                                            ),
                                        child: products[index]);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: 3)
                            ]),
                          ),
                        ]),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        info: ProductBannar[index])));
                              },
                              child: ProductBannar[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: 2,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
