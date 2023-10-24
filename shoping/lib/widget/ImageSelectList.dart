import 'package:flutter/material.dart';

class ImageSelectList extends StatefulWidget {
const ImageSelectList({ super.key ,required this.imagedata});

  final String imagedata;

  @override
  State<ImageSelectList> createState() => _ImageSelectListState();
}


class _ImageSelectListState extends State<ImageSelectList> {
  String _largeImage = '';
  int _selectedImageIndex = 1;

  @override
  void initState() {
    super.initState();
    _largeImage = widget.imagedata.split(',')[0];
    _smallImages = widget.imagedata.split(',');
   //ตัวอย่างข้อมูลคือ imagedata= 'image1,image2,image3'
  }

  List<String> _smallImages = [];
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          // Text(DlargeImage),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Image.network(_largeImage,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(10),

                  ),
                  
                  
                  child: Center(
                    child: Text('${_selectedImageIndex} /${widget.imagedata.split(',').length.toString()}',
                    style: Theme.of(context).textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          //Text('${_selectedImageIndex} ${widget.imagedata.split(',').length.toString()}'),
          const SizedBox(height: 5,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _smallImages.length,
                itemExtent: 80, 
                itemBuilder: (context, index) {
                  final smallImage = _smallImages[index];
                  return 
                  InkWell(
                    onTap: () {
                      setState(() {
                        // เปลี่ยนรูปเล็กที่ถูกเลือกเมื่อถูกคลิก
                        _largeImage = smallImage;
                        _selectedImageIndex = index + 1;
                      });
                    },
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50 ,
                      padding: EdgeInsets.all(4.0),
                      child: _largeImage == smallImage
                          ? Container(
                              width: 80,
                              height: 80,
                              color: Colors.black.withOpacity(0.1),
                              padding: const EdgeInsets.all(5),
                              child: Image.network(smallImage),
                            )
                          : SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.network(smallImage)
                            ),
                    ),
                  );
                }
            )
                    
          ),


          // SingleChildScrollView(
          //   child: Container(
          //     width: 340,
          //     height: 80,
          //     color: Colors.orange,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: _smallImages.length,
          //       itemBuilder: (context, index) {
          //         final smallImage = _smallImages[index];
          //         return InkWell(
          //         onTap: () {
          //           setState(() {
          //             // เปลี่ยนรูปเล็กที่ถูกเลือกเมื่อถูกคลิก
          //             _largeImage = smallImage;
          //             _selectedImageIndex = index + 1;
          //           });
          //         },
          //         child: Container(
          //           color: Colors.white,
          //           width: 50,
          //           height: 50 ,
          //           padding: EdgeInsets.all(4.0),
          //           child: _largeImage == smallImage
          //               ? Container(
          //                   width: 80,
          //                   height: 80,
          //                   color: Colors.black.withOpacity(0.1),
          //                   padding: const EdgeInsets.all(5),
          //                   child: Image.network(smallImage),
          //                 )
          //               : SizedBox(
          //                 width: 80,
          //                 height: 80,
          //                 child: Image.network(smallImage)
          //                 ),
          //         ),
          //                       );
                     
          //       }  
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

