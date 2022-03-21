
import 'package:flutter/material.dart';

class  ListWidget extends StatelessWidget{
    final String? name;

  const ListWidget({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return
     Container(
       height: 80,
       padding: const EdgeInsets.all(5),
       child: Card(
         child: Row(
           children:  [
             const Icon(
               Icons.person_outline,
             ),
             const SizedBox(width: 20,),
             Text(name!)
           ],
         ),
       ),
     );
  }



}