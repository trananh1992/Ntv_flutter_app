import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ntv_mock/page/live_tv_page.dart';
import 'package:ntv_mock/widget/home_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = imgList
        .map((item) => GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NtvLivePlayerPage()));
      },
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      titles[imgList.indexOf(item)],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[

        ],
        centerTitle: true,
        leading: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.live_tv), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NtvLivePlayerPage()));
            }),
          ],
        ),
        title: Container(
            height: 45,
            child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.fitHeight,)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Material(
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: [
                Text("সকল", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("বাংলাদেশ", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("বিশ্ব", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("বিনোদন", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("খেলাধুলা", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("রাজনীতি", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("অপরাধ", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("আইন ও বিচার", style: TextStyle(color: Color(0xFF0e6b39)),),
                Text("অন্যান্য", style: TextStyle(color: Color(0xFF0e6b39)),),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          SizedBox(height: 20,),
          HomeList.generateListView(imgListRecent, titlesRecent, "   সর্বশেষ"),
          HomeList.generateListView(imgListBD, titlesBD, "   বাংলাদেশ"),
          HomeList.generateListView(imgListInt, titlesInt, "   আন্তর্জাতিক"),
          HomeList.generateListView(imgListSp, titlesSp, "   খেলাধুলা"),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'https://www.ntvbd.com/sites/default/files/styles/big_1/public/images/2020/07/11/corona.jpg?itok=Uv390QjW&timestamp=1594487908',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/11/ddddd.jpg?itok=1_RTQ2vq&timestamp=1594487375',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/11/dsa.jpg?itok=px5vjtZW&timestamp=1594486740',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/11/iedcr.jpg?itok=FtuAqrFY&timestamp=1594457062',
];

final List<String> titles = [
  'বিশ্বে করোনায় মৃত প্রায় ৫ লাখ ৬৫ হাজার',
  'স্বাস্থ্যের ডিজিকেও যোগাযোগ থাকার কথা জানিয়েছিলেন সাহেদ',
  'ইতালির প্রধানমন্ত্রী বাংলাদেশিদের ‘ভাইরাস বোমা’ বলেননি : পররাষ্ট্র মন্ত্রণালয়',
  'করোনায় ২৪ ঘণ্টায় ৩০ জনের মৃত্যু, নতুন আক্রান্ত ২৬৮৬ : স্বাস্থ্য অধিদপ্তর'
];

final List<String> imgListRecent = [
  'https://www.ntvbd.com/sites/default/files/styles/big_1/public/images/2020/07/12/sabrina-dr.jpg?itok=J5yJiK7J&timestamp=1594562104',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/eid_gah.jpg?itok=Y8tMen-o&timestamp=1594559102',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/foreign_minister.jpg?itok=OFxioSuI&timestamp=1594558780',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/11/iedcr.jpg?itok=FtuAqrFY&timestamp=1594457062',
];

final List<String> titlesRecent = [
  'ডা. সাবরীনা বরখাস্ত, স্বাস্থ্য অধিদপ্তরের ডিজিকে শোকজ',
  'ঈদুল আজহার নামাজ ঈদগাহে নয়, মসজিদে',
  'বিদেশ গমনে করোনা নেগেটিভ সার্টিফিকেট বাধ্যতামূলক',
  'করোনায় ২৪ ঘণ্টায় ৩০ জনের মৃত্যু, নতুন আক্রান্ত ২৬৮৬ : স্বাস্থ্য অধিদপ্তর'
];

final List<String> imgListBD = [
  'https://www.ntvbd.com/sites/default/files/styles/big_1/public/images/2020/07/12/korbani.jpg?itok=WEmBwNV2&timestamp=1594563143',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/paplu.jpg?itok=Gg3sRAZw&timestamp=1594561904',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/remand.jpg?itok=hd8y44l9&timestamp=1594561857'
];

final List<String> titlesBD = [
  'ঢাকা দক্ষিণে ১৩ পশুরহাট বাতিল, বসবে যে ৫টি হাট',
  'পাপুলের স্ত্রী ও শ‌্যালিকাকে তলব করেছে দুদক',
  'ময়ূর-২ লঞ্চের মালিক রিমান্ড শেষে কারাগারে'
];

final List<String> imgListInt = [
  'https://www.ntvbd.com/sites/default/files/styles/big_1/public/images/2020/07/12/uy.jpg?itok=G7oguwus&timestamp=1594561809',
  'https://www.ntvbd.com/sites/default/files/styles/medium_3/public/images/2020/07/12/us.jpeg?itok=zWaGOx_S&timestamp=1594529842',
  'https://www.ntvbd.com/sites/default/files/styles/medium_3/public/images/2020/07/12/trump.jpg?itok=kbD2GoX4&timestamp=1594520061'
];

final List<String> titlesInt = [
  'প্রাণঘাতী করোনা ঠেকিয়ে দিল মৃত্যুদণ্ড!',
  'যুক্তরাষ্ট্রে করোনায় ২৪ ঘণ্টায় আক্রান্ত ৬৬ হাজার',
  'করোনাকালে প্রথম প্রকাশ্যে মাস্ক পরলেন ট্রাম্প'
];

final List<String> imgListSp = [
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/shoikot.jpg?itok=WmHCw7Yq&timestamp=1594540170',
  'https://www.ntvbd.com/sites/default/files/styles/medium_2/public/images/2020/07/12/rashid-trophy.jpeg?itok=B2iVz4Jo&timestamp=1594551263',
  'https://www.ntvbd.com/sites/default/files/styles/big_1/public/images/2020/07/12/su.jpg?itok=71j2tQkv&timestamp=1594558004'
];

final List<String> titlesSp = [
  'দ্বিতীয়বার বিয়ের পিঁড়িতে সৈকত',
  'বিশ্বকাপ জয়ের পর বিয়ে করবেন রশিদ খান!',
  'বিসিসিআই ছাড়বেন কি না দ্বিধায় সৌরভ'
];