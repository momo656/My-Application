
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/coponanet.dart';
import 'package:untitled/network/local/cache_helper.dart';

import 'package:untitled/shop_app/shop_login/shop_login.dart';
class BoardingModle{
  final String image;
  final String title;
  final String body;
  BoardingModle({
    required this.image,
    required this.title,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast=false;

var BoadCotroller =PageController();

List<BoardingModle> boarding=[
  BoardingModle(
      image: 'images/onboarding_1.png',
      title: 'On Board 1 title',
      body: 'On Board 1 body'
  ),
  BoardingModle(
      image: 'images/onboarding_1.png',
      title: 'On Board 2 title',
      body: 'On Board 2 body'
  ),
  BoardingModle(
      image: 'images/onboarding_1.png',
      title: 'On Board 3 title',
      body: 'On Board 3 body'
  ),
];
void submit(){
  CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
  ).then((value) {
    navigationAndFinish(
      context, ShopLoginScreen(),);}
      );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            submit();

          },
            child: Text(
            'skip'
          ),),
        ],
      ),
      body:Column(
        children:
        [
          Expanded(
            child: PageView.builder(
              physics:BouncingScrollPhysics(),
              controller: BoadCotroller,
              onPageChanged: (int index){
                if(index==boarding.length -1){
                  setState(() {
                    isLast=true;
                  });
                }else{
                  setState(() {
                    isLast=false;
                  });
                }

              },
              itemBuilder: (context ,index)=>BuildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: BoadCotroller,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),

                  count: boarding.length,

                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLast){
                        submit();
                      }else{ BoadCotroller.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );}

                    },
                    child: Icon(
                      Icons.arrow_forward,
                    ),

                )
              ],
            ),
          ),
        ],
      )


    );
  }
}
Widget BuildBoardingItem(BoardingModle Modle)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image(
      image: AssetImage('${Modle.image}'),
    ),
    SizedBox(
      height: 60.0,
    ),
    Text(
      '${Modle.title}',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 15.0,
    ),
    Text(
      '${Modle.body}',
      style: TextStyle(
        fontSize: 14.0,

      ),
    ),
  ],
);