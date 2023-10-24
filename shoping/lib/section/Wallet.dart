
import 'package:flutter/material.dart';
import 'package:shoping/colors/color.dart';

class Wallet extends StatelessWidget {
const Wallet({ super.key });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Container(
          width: 350,
          height: 60,
          color: Colors.white,
          child:Row(    
            children: [
          
              const SizedBox(width: 10,),
              SizedBox(
                width: 80,
                child: Row(
                  children: [
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.graylight,
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 70,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const ImageIcon(
                              AssetImage('assets/icons8-cash-100.png'), // ระบุพาธของรูปภาพที่คุณต้องการ
                              size: 25.0, // กำหนดขนาดของ icon
                              color: AppColors.greenC, // กำหนดสีของ icon
                            ),
                            const SizedBox(width: 5,),
                            Text("฿ 6.24",style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],),
                          Align(
                            alignment: Alignment.topCenter,
                            child:  Text("Cash",style: Theme.of(context).textTheme.titleSmall!
                              .copyWith())
                          )
                      ],),
                    )
                  ],)
              ),
              const Spacer(),
              const SizedBox(width: 10,),
              SizedBox(
                width: 80,
                child: Row(
                  children: [
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.graylight,
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 70,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const ImageIcon(
                              AssetImage('assets/icons8-coin-50.png'), // ระบุพาธของรูปภาพที่คุณต้องการ
                              size: 25.0, // กำหนดขนาดของ icon
                              color: AppColors.greenC, // กำหนดสีของ icon
                            ),
                            
                            const SizedBox(width: 5,),
                            Text(" 0.00",style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],),
                          Align(
                            alignment: Alignment.topCenter,
                            child:  Text("My Coins",style: Theme.of(context).textTheme.titleSmall!
                              .copyWith())
                          )
                      ],),
                    )
                  ],)
              ),
              const Spacer(),
              const SizedBox(width: 10,),
              SizedBox(
                width: 80,               
                child: Row(
                  children: [
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.graylight,
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 70,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const ImageIcon(
                              AssetImage('assets/icons8-discount-64.png'), // ระบุพาธของรูปภาพที่คุณต้องการ
                              size: 25.0, // กำหนดขนาดของ icon
                              color: AppColors.greenC, // กำหนดสีของ icon
                            ),
                            
                            const SizedBox(width: 5,),
                            Text(" 5",style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],),
                          Align(
                            alignment: Alignment.topCenter,
                            child:  Text("โค้ดส่วนลด",style: Theme.of(context).textTheme.titleSmall!
                              .copyWith())
                          )
                      ],),
                    )
                  ],)
              ),
              const Spacer(),
              const SizedBox(width: 10,),
          
                  
            ],)
        ),
      ),
    );
  }
}

