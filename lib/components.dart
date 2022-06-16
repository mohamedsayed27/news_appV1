// import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_screen.dart';
//
// import 'layout/news_app/cubit/cubit.dart';
// bool isdone = false;
Widget articleItemBuilder(article ,context) =>
    InkWell(
      onTap: () {
        navigateTo(context, WebScreen(url: article['url']));
      },
      child: Padding(
  padding:  const EdgeInsets.all(15.0),
  child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${article['urlToImage']}')),
          ),
        ),
         const SizedBox(width: 10,),
        Expanded(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                Expanded(
                  child: Text('${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow : TextOverflow.ellipsis,
                    ),
                ),

                Text('${article['publishedAt']}',style: const TextStyle(color: Colors.grey,fontSize: 10),),
              ],
            ),
          ),
        ),
      ],
  ),
),
    );
Widget articleBuilder (List list,{isSearch = false}){
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (BuildContext context){
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return articleItemBuilder(list[index],context);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  const EdgeInsets.only(left: 15,right: 15),
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              height: 1,
            ),
          );
        },
        itemCount: list.length ,
      );
    },
    fallback:(BuildContext context)=> isSearch? Container():const Center(child: CircularProgressIndicator()) ,
  );

}



Widget defautltFormField(
{
  required TextEditingController controller,
  required TextInputType type,
  Function?  onSubmit ,
  Function? onChanged,
  Function? onTap,
  required Function validate,
  required String label,
  required IconData prefixIcon,
}
) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: (s){
      onSubmit!(s);
    },
    onChanged: (c){
      onChanged!(c);
    },
    validator: (v){
      validate(v);
      return null;
    },
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
          prefixIcon
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
    ),
    onTap: (){
      onTap!();
    },

  );
}
void navigateTo(context , widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget
    ));
// Widget buildTaskItem(Map model , context){
//   return Dismissible(
//     background:Card(
//       color: Colors.red,
//     ),
//     key: Key(model['id'].toString()),
//     child: Padding(
//       padding:  EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             child: Text('${model['time']}'),
//             radius: 40.0,
//           ),
//           SizedBox(width: 20 ,),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('${model['title']}',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.black ),),
//                 Text('${model['date']}',style: TextStyle(fontWeight:FontWeight.w300,color: Colors.grey[800] ),),
//               ],
//             ),
//           ),
//           SizedBox(width: 20 ,),
//           IconButton(
//               onPressed: (){
//                 // NewsCubit.get(context).updateData(status: 'done', id: model['id']);
//                 // isdone=true;
//               },
//               icon:/*isdone?Icon(Icons.check_box):*/Icon(Icons.check_box_outlined) ,
//           ),
//           IconButton(
//               onPressed: (){
//                 // AppCubit.get(context).updateData(status: 'archived', id: model['id']);
//               },
//               icon: Icon(Icons.archive_outlined)),
//         ],
//       ),
//     ),
//     onDismissed: (direction){
//       // AppCubit.get(context).deleteRecord(id: model['id']);
//     },
//   );
// }
// Widget buildConditionalBuilder({@required List<Map> tasks}){
//   return ConditionalBuilder(
//     condition:tasks.length>0 ,
//     builder: (context) => ListView.separated(
//       itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
//       separatorBuilder: (context,index)=>Container(
//         width: double.infinity,
//         color: Colors.grey,
//         height: 1,
//       ),
//       itemCount:tasks.length, ) ,
//     fallback: (context) => Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.menu),
//           Text("Please enter elements to display them")
//         ],
//       ),
//     ),
//   );
// }
