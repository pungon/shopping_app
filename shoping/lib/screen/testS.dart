import 'package:flutter/material.dart';

import 'package:shoping/models/modelPd.dart';
import 'package:shoping/models/modelProvider.dart';
import 'package:provider/provider.dart';

class TestS extends StatefulWidget {
const TestS({ super.key });

  @override
  State<TestS> createState() => _TestSState();
}


class _TestSState extends State<TestS> {

  var  demo = 'ฟฟฟ';
  
  @override
  Widget build(BuildContext context) {
     MyModel myModel = Provider.of<MyModel>(context); 

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 500,
          child: Column( 
            children: [
              
              Text('ค่า demo: $demo'), 
              Text(myModel.data),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    demo = 'ข้อมูลใหม่ที่เปลี่ยนแปลง';
                    myModel.updateData("New data");  // เปลี่ยนข้อมูลใน demo
                  });
                },
                child: Text('กดเพื่อเปลี่ยนข้อมูล'),
              ),
              
               
              
            ],
          ),
        ),
      ),
    );
  }
}

