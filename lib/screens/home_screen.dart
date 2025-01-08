import 'package:contact_app/screens/add_user.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";
  //final itemModelList1 = ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff29384D),
      body: Padding( 
        padding: const EdgeInsets.only(top: 50,left: 28, right: 16),
        child: Column(
         
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
            Image.asset("assets/images/route.png",
            width: 117,
            height: 37,),
              ]),
            Lottie.asset("assets/animations/empty_list.json"),
           const Text("There is No Contacts Added Here",style: TextStyle(
              fontSize: 20,
              color: Color(0xffFFF1D4),
              fontWeight: FontWeight.w500,
    
            ),),
            const SizedBox(height: 230,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor:const Color(0xffFFF1D4),
                  onPressed: (){
                     Navigator.pushNamed(context, AddUser.routeName);
                  },
                child: const Icon(Icons.add),
                ),
              ],
            )
            
          ],
        
        ),
      ),
    
    );
  }
}