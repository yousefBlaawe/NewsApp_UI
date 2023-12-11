import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_Layout/cubit.dart';
import '../../../layout/news_Layout/state.dart';
import '../../../sheard/components/components.dart';
class searchScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();

    return BlocConsumer<cubitNews,stateNews>(
      listener: (context,state){},
      builder: (context,state){
        var LIst=cubitNews.get(context).listOfSearchDate;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.all(20.0),
                child: defultTextFromFild(
                    onchange: (String val )
                    {
                      cubitNews.get(context).getSearchData(val);
                    },
                    Controller: controller,
                    KeypordType: TextInputType.text,
                    valid: (  val)
                    {
                      if(val!.isEmpty)
                        return 'search con\'t be null ';
                      else
                        return null ;
                    },
                    ICON: Icons.search,
                    lable: 'Search'),
              ),
              ConditionalBuilder(
                condition: state is! getDataSearchLoding,
                builder: (BuildContext context) {
                  return Expanded(child: ListView.separated(
                    itemBuilder: (context,index){
                      return BulderArticalItem(LIst[index]);
                    },
                    separatorBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsetsDirectional.all(20.0),
                        child: Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      );
                    },
                    itemCount: LIst.length,));
                },
                fallback: (BuildContext context) {
                  return CircularProgressIndicator(
                      backgroundColor: Colors.deepOrange,
                      color: Colors.black
                  );
                },

              )
            ],
          ),
        );
      },
    );
  }

}