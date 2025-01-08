import 'package:contact_app/models/list_model.dart';
import 'package:contact_app/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
   UserList({required this.itemModel_p,required this.itemModelList, super.key});
 static const String routeName = "userList";
 final ItemModel itemModel_p;
 List<ItemModel> itemModelList;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Color(0xff29384D),
    body: SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: true,
      minimum:const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset("assets/images/route.png",
           width: 117,
          height: 37,),
           const SizedBox(height: 27,),
           Expanded(
             child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
               childAspectRatio: 0.555555555,
               mainAxisSpacing: 16,
               crossAxisSpacing: 16
              ),
              itemCount: widget.itemModelList.length,
              itemBuilder: (context, index) => CustomUserContent(
                itemModel: widget.itemModelList[index],
                itemModelList_1: widget.itemModelList,
                onDelete: () {
              setState(() {
                widget.itemModelList.removeAt(index); // Remove item and rebuild UI.
              });
            },
               
              ),
              ),
              
           )
      
        ],
      ),
    ),
    
    );
  }
}