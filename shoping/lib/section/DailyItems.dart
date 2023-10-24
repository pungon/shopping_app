

import 'package:flutter/material.dart';
import 'package:shoping/colors/color.dart';
import 'package:shoping/models/modelPd.dart';
import 'package:shoping/datas/dataApi.dart';
import 'package:shoping/widget/ProductDetail.dart';

import 'package:intl/intl.dart';


class DailyItems extends StatefulWidget {
const DailyItems({ super.key});

  @override
  State<DailyItems> createState() => _DailyItemsState();
}

class _DailyItemsState extends State<DailyItems> {


  @override
  Widget build(BuildContext context){

   
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('สินค้าประจำวัน',
                style: Theme.of(context).textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold,color: AppColors.greenC)
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.graylight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FutureBuilder<List<ProductM>>(
                future: fetchProduct(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<ProductM>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // หากข้อมูลกำลังโหลด
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final products = snapshot.data!;
                    return GridView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 แถว
                      mainAxisSpacing: 5.0, // ระยะห่างระหว่างแถว
                      crossAxisSpacing: 5.0, // ระยะห่างระหว่างคอลัมน์
                      childAspectRatio: 190 / 280, // ปรับสัดส่วนความสูงและความกว้าง
                    ),
                    itemCount: products.length, // จำนวนรายการ
                    itemBuilder: (BuildContext context, int index) {
              
                    return InkWell(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(product: products[index]),
                          ),
                        );

                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                        
                            products[index].image_1 != null
                            ? Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  //height: 170,
                                  child: Image.network(products[index].image_1!.split(',')[0]),
                                ),
                                products[index].discount != null
                                ? Positioned(
                                  right:0 ,
                                  top: 0,
                                  child: SizedBox(
                                    width: 35,
                                    height: 40,
                                    child: Stack(
                                      children: [
                                        Image.network('https://saveimages.blob.core.windows.net/banner/discount.png'),
                                        Positioned(
                                          top: 0,
                                          child: SizedBox(
                                            width: 35,
                                            height: 40,
                                            child: Column(
                                              children: [
                                                 Container(height: 1,),
                                                Text('ลด',
                                                 style: Theme.of(context).textTheme.titleSmall!
                                                 .copyWith(color: Colors.white,fontSize: 10),
                                                ),
                                                Text('${products[index].discount}%',
                                                 style: Theme.of(context).textTheme.titleSmall!
                                                 .copyWith(color: AppColors.greenC),
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  )
                                )
                                : const SizedBox()
                                
                              ],
                            )
                            :
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 170,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greenC, // สีเส้นขอบ
                                        width: 0.5,   
                                      ) 
                                    ),    // ความกว้างของเส้นขอบ
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported_outlined,color: AppColors.greenC,size: 60,)
                                    )
                                  ),
                                  products[index].discount != null
                                  ? Positioned(
                                    right:0 ,
                                    top: 0,
                                    child: SizedBox(
                                      width: 35,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Image.network('https://saveimages.blob.core.windows.net/banner/discount.png'),
                                          Positioned(
                                            top: 0,
                                            child: SizedBox(
                                              width: 35,
                                              height: 40,
                                              child: Column(
                                                children: [
                                                   Container(height: 1,),
                                                  Text('ลด',
                                                   style: Theme.of(context).textTheme.titleSmall!
                                                   .copyWith(color: Colors.white,fontSize: 10),
                                                  ),
                                                  Text('${products[index].discount}%',
                                                   style: Theme.of(context).textTheme.titleSmall!
                                                   .copyWith(color: AppColors.greenC),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    )
                                  )
                                  : const SizedBox()
                            
                            
                                ],
                              ),
                            ),
                            



                            const SizedBox(height: 5,),
                             Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(products[index].product_name, maxLines: 1,overflow: TextOverflow.ellipsis)
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Text('B${NumberFormat.decimalPattern().format(products[index].cost)}',
                                        style: Theme.of(context).textTheme.titleMedium!
                                        .copyWith(color: AppColors.greenC,fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      products[index].SoldQuantity >= 999
                                      ?Text("ขายแล้ว ${products[index].SoldQuantity /1000} พัน+",
                                        style: Theme.of(context).textTheme.titleSmall!
                                        .copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                      )
                    
                                      :Text("ขายแล้ว ${products[index].SoldQuantity}",
                                        style: Theme.of(context).textTheme.titleSmall!
                                        .copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                            
                        
                        
                        ]),
                      ),
                    );
                      
                    }
                    );
                      
                      
                      
                      
                      
                  }
                }
              ),
            ),
          )



      ],),
    );
  }
}
