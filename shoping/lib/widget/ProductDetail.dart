import 'package:flutter/material.dart';
import 'package:shoping/colors/color.dart';
import 'package:shoping/models/modelPd.dart';
import 'package:shoping/widget/ImageSelectList.dart';

import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';

import 'package:shoping/models/modelProvider.dart';
import 'package:provider/provider.dart';


class ProductDetail extends StatefulWidget {
const ProductDetail({ super.key, required this.product }) ;



final ProductM product; 

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {



  List<ProductM> dataList = []  ;

  @override
  Widget build(BuildContext context){
     Shopping_cart Shopping_cartData = Provider.of<Shopping_cart>(context); 


  

    return Scaffold(
      
      body: Stack(
        children: [
        SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                  children: [
                  // Image.network(product.image_1!.split(',')[0]),
                    widget.product.image_1 != null
                    ?
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width+90,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ImageSelectList(imagedata:widget.product.image_1! )
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greenC,
                            width: 1
                          )
                        ),
                        child: Icon(Icons.image_not_supported,size: 80,color: AppColors.greenC,)
                      ),
                    ),
                    
                    // Positioned(
                    //   left:5, 
                    //   top:15,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Colors.black.withOpacity(0.1),
                    //       // สามารถเพิ่มสีพื้นหลังหรือสิ่งอื่น ๆ ตามต้องการ
                    //     ),
            
                    //     child: IconButton(
                    //       icon: const Icon(Icons.arrow_back,color: Colors.white,),
                    //       onPressed: () {
                    //         // กำหนดการทำงานเมื่อปุ่มถอยหลังถูกกด
                    //         Navigator.of(context).pop(); // หรืออื่น ๆ ตามที่คุณต้องการ
                    //       },
                    //     ),
                    //   ),
                    // )

                  ]
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 10,
                    color: AppColors.greenC.withOpacity(0.3),
                ),
                const SizedBox(height: 10,),
                  
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.product.discount != null
                      ?
                      Row(
                        children: [
                          SizedBox(
                            width: 280,
                            height: 45,
                            child: Text(widget.product.product_name,
                              maxLines: 2, 
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          
                          Spacer(),
                          SizedBox(
                            width: 35,
                            height: 45,
                            child: Stack(
                              children: [
                                Image.network('https://saveimages.blob.core.windows.net/banner/discount.png'),
                                Positioned(
                                  left: 0,
                                  right: 0,
          
                                  child: Column(
                                    children: [
                                      Text('ลด',
                                      style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(color: Colors.white),),
                                      Text('${widget.product.discount}%',
                                        style: Theme.of(context).textTheme.titleSmall!
                                        .copyWith(color: AppColors.greenC),
                                      )
                                    ],
                                  )
                                )
                              ],
                            ),
                          )
                        ],
                      )
                      : SizedBox(
                            width: 280,
                            height: 45,
                            child: Text(widget.product.product_name,
                              maxLines: 2, 
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                            ),
                      ),
                      
                      const SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:const  EdgeInsets.symmetric(horizontal: 10),
                        child: Text('฿ ${NumberFormat.decimalPattern().format(widget.product.cost)}',
                        style: Theme.of(context).textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w500,color: AppColors.greenC),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  color: AppColors.greenC.withOpacity(0.3),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    children: [
                      
                      Row(
                        children: [
                          
                          for (int i = 0; i < 5; i++)
                          Icon(
                            i< widget.product.rate_product.floor()
                            ? Icons.star
                            : i < (widget.product.rate_product + 0.5).floor() 
                              ? Icons.star_half
                              : Icons.star_border,
                            color: AppColors.greenC,
                            size: 20,
                          ),
                              
                        ],
                      ),
                      const SizedBox(width: 10,),
                      Text(widget.product.rate_product.toString(),
                        style: Theme.of(context).textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 30,),
                      widget.product.SoldQuantity > 999
                      ? Text('ขายแล้ว ${((widget.product.SoldQuantity /1000)*10).toInt() /10}พัน ชิ้น')
                      //Text('ขายแล้ว ${(product.SoldQuantity /1000).floor()}.${((product.SoldQuantity / 1000)* 10).toInt() % 10} พัน ชิ้น')
                      : Text('ขายแล้ว ${widget.product.SoldQuantity} ชิ้น')
            
                    ]
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    color: AppColors.greenC.withOpacity(0.3),
                  ),
                  
      
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:const  EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding:const EdgeInsets.only(bottom: 10,left: 10),
                          child: Text('ค่าขนส่ง',
                          style: Theme.of(context).textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: AppColors.greenC.withOpacity(0.3),
                        ),
      
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage('assets/icons8-carry-48.png'), // ระบุพาธของรูปภาพที่คุณต้องการ
                                size: 25, // กำหนดขนาดของ icon
                                color: AppColors.greenC, // กำหนดสีของ icon
                              ),
                              const SizedBox(width: 10,),
                              Text('ราคา',style: Theme.of(context).textTheme.titleMedium!),
                              const SizedBox(width: 10),
                              Text('฿ ${widget.product.transport_price}',style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.w500)
                              ,)
                        
                        
                          ],),
                        ),
      
                      ],
                    ),
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    color: AppColors.greenC.withOpacity(0.3),
                  ),
      
                  const SizedBox(height: 10),
      
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ExpandableNotifier(
                      child: Column(
                        children: <Widget>[
                          ExpandablePanel(
                            //header: Text('รายละเอียด'),
                            collapsed: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('รายละเอียด',
                                      style: Theme.of(context).textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      widget.product.Description,maxLines:4,overflow:TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            expanded: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('รายละเอียด',
                                      style: Theme.of(context).textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      widget.product.Description,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            color: AppColors.greenC.withOpacity(0.3),
                          ),
                          ExpandableButton(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "แสดงเพิ่มเติม",
                                  style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: AppColors.greenC),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 5,
                            color: AppColors.greenC.withOpacity(0.3),
                          ),
                          
      
                        ],
                      ),
                    ),
                  ),
                  //Text('ไม่มีข้อมูล'),

                  //ข้อมูล สินค้าที่เลือก
                  // Container(
                  //   width: 100,
                  //   height: 30,
                  //   color: Colors.pink.withOpacity(0.3),
                  //   child: Row(
                  //     children: [
                  //       for (var a in Shopping_cartData.data )
                  //       Text(a.product_id.toString())
                  //     ],
                  //   ),
                  // ),
                  
                  // SizedBox(
                  //   width: 100,
                  //   height: 100,
                  //   child: dataList.isNotEmpty
                  //     ? ListView.builder(
                  //         itemCount: dataList.length,
                  //         itemBuilder: (ctx, index) {
                  //           return Column(
                  //             children: [
                  //               Text("data"),
                  //               Text(dataList[index].product_name),
                  //             ],
                  //           );
                  //         },
                  //       )
                  //     : Text('ไม่มีข้อมูล'),
                  // ),

      
                  const SizedBox(height: 150,),
                  
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 20),
          child: Positioned(
            top:20,
            //right: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                children: [
                Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.1),
                          // สามารถเพิ่มสีพื้นหลังหรือสิ่งอื่น ๆ ตามต้องการ
                        ),
            
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back,color: Colors.white,),
                          onPressed: () {
                            // กำหนดการทำงานเมื่อปุ่มถอยหลังถูกกด
                            Navigator.of(context).pop(); // หรืออื่น ๆ ตามที่คุณต้องการ
                          },
                        ),
                      ),
                  Spacer(),
                  Stack(
                    children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),          
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                    Positioned(
                      top:0,
                      right: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red
                      ),
                        child: Center(child: Text('${Shopping_cartData.data.length}',style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: Colors.white)
                        ,)),
                      ))
                  ]
                  ),
                ],
              ),
            )
          ),
        ),

        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                     setState(() {
                      
                      Shopping_cartData.updateData(ProductMId(product_id: widget.product.product_id));
                     
                      print('ข้อมูลที่ถูกเพิ่ม: ${widget.product.product_id}');
                      
                    
                     });
                     
                  },
                    
                  child: Container(
                    width: 150,
                    height: 60,
                    color: AppColors.greenC.withOpacity(0.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_shopping_cart_sharp,color:Colors.white),
                        Text('เพิ่มไปยังรถเข็ญ',
                          style: Theme.of(context).textTheme.titleMedium!
                          .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                    if (dataList.isNotEmpty) {
                        print('ข้อมูลที่ถูกเพิ่มล่าสุด: ${dataList[0].product_name}');
                      } else {
                        print('ไม่มีข้อมูลในรายการ');
                      }
                      });
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    color: AppColors.greenC,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart_checkout_outlined,color:Colors.white),
                        Text('ซื้อสินค้า',
                          style: Theme.of(context).textTheme.titleMedium!
                          .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),

            ]),
          ),
        )

        ]
      ),
    
      
      
    );
  }
}


