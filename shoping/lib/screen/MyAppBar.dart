import 'package:flutter/material.dart';
import 'package:shoping/colors/color.dart';
import 'package:shoping/screen/search.dart';

class MyAppBar extends StatefulWidget {
const MyAppBar({ super.key }) ;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  List<String> searchPhrases = ['1 บาท ส่งฟรี', 'iPhone 14 pro', 'หมูแผ่นอบกรอบ', 'ถุงเท้า gq'];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTextAnimation();
  }

  Future<void> _startTextAnimation() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        currentIndex = (currentIndex + 1) % searchPhrases.length;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(),
                          ),
                        );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30,             
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      //label: Text('Enter your name'),
                      label: Text(searchPhrases[currentIndex],
                        style:Theme.of(context).textTheme.titleMedium!
                        .copyWith(color: AppColors.greenC,fontWeight: FontWeight.bold,),
                      ),
                      prefixIcon: const Icon(Icons.search,color: AppColors.greenC,),
                      //suffixIcon: const Icon(Icons.photo_camera_outlined,color: AppColors.greenC), // ไอคอนที่จะแสดงด้านหลังช่อง input
                      border:InputBorder.none,
                      filled: true, // เปิดใช้งานการเติมสีพื้นหลัง
                      fillColor: Colors.white, // สีพื้นหลัง
                                            
                    ),   
                  ),
                  
                ),
              ),
            ),
            
            const SizedBox(width: 10,),
            
            const Flexible(
              flex: 1,
              child: SizedBox(
                width: 30,
                height: 30,
                child:  Icon(Icons.shopping_cart_outlined,
                  color:Colors.white,
                  size:20,
                  
                ),
              ),
            )

        ]),
        
      ),
    );
  }
}
