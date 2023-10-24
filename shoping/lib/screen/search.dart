import 'package:flutter/material.dart';

class Search extends StatelessWidget {
const Search({ super.key }) ;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Search',
            style: Theme.of(context).textTheme.titleLarge!
            .copyWith(color: Colors.white)
          ),
        
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.white), // ไอคอนปุ่ม Back
          onPressed: () {
            Navigator.pop(context);
          }
        )
      ),
      body:const Center(
        child: Text('Search')
      ) ,
      
    );
  }
}

