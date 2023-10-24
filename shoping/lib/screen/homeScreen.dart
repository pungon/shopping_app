import 'package:flutter/material.dart';
import 'package:shoping/widget/ImagesSlide .dart';
import 'package:shoping/datas/demoData.dart';
import 'package:shoping/section/Wallet.dart';
import 'package:shoping/section/DailyItems.dart';
import 'package:shoping/colors/color.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> imageUrlList = imageSlideD.map((imageData) => imageData.imageUrl).toList();

  @override
  Widget build(BuildContext context){
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ImagesSlide(imageLists: imageUrlList),
              ),
              const Wallet(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                color: AppColors.graylight.withOpacity(0.5),
              ),
              DailyItems()
              
        
          ]),
        ),
      );
  }
}
