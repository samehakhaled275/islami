import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/Hadeth.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeath_detalis';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackgroundImage()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Card(
              elevation: 12,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.content,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ),
            ),
          ),
        ));
  }
}
