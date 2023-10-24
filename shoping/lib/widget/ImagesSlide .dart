import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';




class ImagesSlide extends StatefulWidget {
  const ImagesSlide({
    super.key,
    required this.imageLists,
  
  });

  final List<String> imageLists ;

  @override
  State<ImagesSlide> createState() => _ImagesSlideState();
}

class _ImagesSlideState extends State<ImagesSlide> {


  @override
  Widget build(BuildContext context) {
    
    return CarouselSlider(
      items: widget.imageLists.map((url) {
        return Image.network(
          url,
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true, // เปิดใช้งานการเล่นอัตโนมัติของรูปภาพใน CarouselSlider
        aspectRatio: 16 / 5, // สัดส่วนของรูปภาพ ในที่นี้เป็น 16:9
        enlargeCenterPage:
            true, // เปิดใช้งานการขยายภาพของรูปภาพในตรงกลางของ CarouselSlider
        autoPlayCurve: Curves
            .fastOutSlowIn, // ความเร็วในการเล่นอัตโนมัติของรูปภาพใน CarouselSlider
        autoPlayAnimationDuration:const  Duration(
            milliseconds: 800), // ระยะเวลาในการเปลี่ยนรูปภาพใน CarouselSlider
        viewportFraction: 1, // สัดส่วนของพื้นที่การแสดงรูปภาพใน CarouselSlider
        // ค่า viewportFraction ที่ต่ำกว่า 1 จะทำให้รูปภาพที่แสดงใน CarouselSlider อยู่กึ่งกลางหน้าจอ
        // โดยค่า viewportFraction 0.8 หมายความว่ารูปภาพจะมีขนาดให้แสดงในพื้นที่ของหน้าจอเพียง 80% เท่านั้น
        // ซึ่งส่งผลให้เห็นรูปภาพที่อยู่ซ้ายของหน้าจอกว่างอยู่เล็กน้อยทางขวา
      ),
    );
  }
}