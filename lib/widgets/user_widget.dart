import 'package:contact_app/models/list_model.dart';
import 'package:flutter/material.dart';

class CustomUserContent extends StatefulWidget {
   CustomUserContent({required this.itemModel,required this.itemModelList_1,required this.onDelete, super.key});
  final ItemModel itemModel;
  List<ItemModel> itemModelList_1;
   final VoidCallback onDelete;
  @override
  State<CustomUserContent> createState() => _CustomUserContentState();
}

class _CustomUserContentState extends State<CustomUserContent> {
  @override
  Widget build(BuildContext context) {
    return   Container(
            width: 160,
            height: 292,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
             ),
             child: Column(
              children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),
                topRight: Radius.circular(16)),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.file(widget.itemModel.image!,
                  height: 177,
                  width: 177,
                  fit: BoxFit.cover,
                  ),
                  Container(
                    margin:const EdgeInsets.only(left: 8,bottom: 8),
                    width: 84,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:const Color(0xffFFF1D4),
                    ),
                    child:   Center(
                      child: Text("${widget.itemModel.name}",style:const TextStyle(
                        color: Color(0xff29384D),
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),)),
                  )
              ]),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                    color: Color(0xffFFF1D4)
                  ),
                  child: Column(
                    children: [
                     Row(children: [
                      const Icon(Icons.mail),
                      const SizedBox(width: 2,),
                      Text("${widget.itemModel.email}",style:const TextStyle(
                        color: Color(0xff29384D),
                        fontSize: 9,
                        fontWeight: FontWeight.w500
                      ),)

                    ],),
                    const SizedBox(height: 4,),
                       Row(children: [
                      const Icon(Icons.phone),
                       const SizedBox(width: 2,),
                      Text("${widget.itemModel.phone}",style: const TextStyle(
                        color: Color(0xff29384D),
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                      ),)
                 ],),
                const SizedBox(height: 5,),
                 SizedBox(
                  height: 31,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF93E3E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                   onPressed: ()
                   {
                     widget.onDelete();
                   },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete,color: Colors.white,),
                        Text("Delete",style: TextStyle(
                          color: Colors.white
                        ),)
                      ],
                    )
                    ),
                 )
              ]
                  ),
                ),
              )
              ]
             ),
           );
  }
}