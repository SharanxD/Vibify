import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibify/modals/colors.dart';
import 'package:vibify/modals/songs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  final _pagecontroller=PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);




  final List<Widget> Pages=[
    HomePage(),
    ExplorePage(),
    RadioPage(),
    ProfilePage()
  ];


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol= myColors();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mcol.darkblue,
        title: Text("VIBIFY",style: GoogleFonts.questrial(color: mcol.neonblue,fontSize: 50,fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(onPressed: (){},
            icon: Icon(Icons.search,color: Colors.white,size: 30,),),
          )
        ],
      ),
      extendBody: true,
      body: PageView(
        physics: ScrollPhysics(),
        controller: _pagecontroller,
        children: List.generate(Pages.length, (index) => Pages[index]),

      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Colors.white,
        notchColor: mcol.neonblue,
        showBlurBottomBar: false,
        bottomBarItems: [
          BottomBarItem(inActiveItem: Icon(Icons.home_outlined,color: mcol.darkblue,), activeItem: Icon(Icons.home_outlined,color: mcol.darkblue,),itemLabel: "Home"),
          BottomBarItem(inActiveItem: Icon(Icons.place_outlined,color: mcol.darkblue,), activeItem: Icon(Icons.place_outlined,color: mcol.darkblue,),itemLabel: "Explore"),
          BottomBarItem(inActiveItem: Icon(Icons.radio_outlined,color: mcol.darkblue,), activeItem: Icon(Icons.radio_outlined,color: mcol.darkblue,),itemLabel: "Radio"),
          BottomBarItem(inActiveItem: Icon(Icons.person_2_outlined,color: mcol.darkblue,), activeItem: Icon(Icons.person_2_outlined,color: mcol.darkblue,),itemLabel: "Profile"),
        ],
        onTap: (int value) {
          _pagecontroller.jumpToPage(value);
        },

      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final List<Widget> imageSliders = SongList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item.coverurl, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(item.Songname,style: GoogleFonts.questrial(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          )),
    ),
  ))
      .toList();


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    myColors mcol= myColors();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Albums",style: GoogleFonts.questrial(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
              TextButton(onPressed: () {  },
                  child: Text("View all",style: GoogleFonts.questrial(color: Colors.grey,fontSize: 24),))
            ],
          ),
          SizedBox(height: 10,),
          Container(height: size.height*0.18,width: size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true
              ),
              items: imageSliders,

            ),

          ),
          SizedBox(height: 10,),
          Text("Vibes Weekly",style: GoogleFonts.questrial(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
          SizedBox(height: 10,),
          Container(height: size.height*0.18,width: size.width,child: VidPlayer(),),
          SizedBox(height: 10,),
          Text("Recent Music",style: GoogleFonts.questrial(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
          SizedBox(height: 10,),
          Container(
            width: size.width,
            height: size.height*0.33,
            child: ListView.builder(
                itemCount: SongList.length,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width*0.8,
                      height: size.height*0.07,
                      decoration: BoxDecoration(
                          color: mcol.neonblue.withOpacity(0.02),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SizedBox(width: 20,),
                              Text(index+1<10?"0"+(index+1).toString():(index+1).toString(),style: GoogleFonts.questrial(color: Colors.white,fontSize: 20),),
                              SizedBox(width: 20,),
                              Image.network(SongList[index].coverurl,width: 50,),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(SongList[index].Songname,style: GoogleFonts.questrial(color: Colors.white,fontSize: 20),),
                                  Text(SongList[index].Artist,style: GoogleFonts.questrial(color: Colors.grey,fontSize: 16),)
                                ],
                              ),



                            ],
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: Colors.white,size: 20,)),


                        ],
                      ),
                    ),
                  );

                }),
          )


        ],
      ),
    );
  }
}
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Explore Page",style: GoogleFonts.questrial(color: Colors.white,fontSize: 40),));
  }
}
class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Radio Page",style: GoogleFonts.questrial(color: Colors.white,fontSize: 40),));
  }
}
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile Page",style: GoogleFonts.questrial(color: Colors.white,fontSize: 40),));
  }
}
class VidPlayer extends StatefulWidget {
  const VidPlayer({super.key});

  @override
  State<VidPlayer> createState() => _VidPlayerState();
}

class _VidPlayerState extends State<VidPlayer> {
  final String vidurl= (SongList.toList()..shuffle()).first.vidlink;
  late YoutubePlayerController _controller;

  @override
  void initState(){
    final videoID=YoutubePlayer.convertUrlToId(vidurl);
    _controller=YoutubePlayerController(initialVideoId: videoID!,flags: YoutubePlayerFlags(autoPlay: true));
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    myColors mcol = myColors();
    return Container(
      width: size.width,
      height: size.height,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: mcol.neonblue,

      ),
    );
  }
}





