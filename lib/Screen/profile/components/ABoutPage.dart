
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'EnteredData.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,top: 15),
        child: Container(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your current news",style: Theme.of(context).textTheme.headline6,),
              InkWell(
                child: ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  ),

                  leading: Icon(
                    Icons.info_outline,
                    color: kPrimaryColor,
                  ),
                  trailing:  Icon(
                    Icons.edit,
                  ),
                ),
                onTap: (){
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context, builder: (builder)=>EnteredData());
                },
              ),
              Divider(),
              Text("Choose news",style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 20,),
              Text("available",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("Busy",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("At school",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("In the cinema",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("at work",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("The battery is about to run out",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("I can't talk, only ChatApp",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("in a meeting",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("In the club",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("sleeping",style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 20,),
              Text("emergency calls only",style: Theme.of(context).textTheme.subtitle2,),

            ],
          ),
        ),
      ),
    );
  }
}
