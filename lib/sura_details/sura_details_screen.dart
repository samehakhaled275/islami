import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/provider/settings_provider.dart';
import 'package:islami/sura_details/sura_details_argument.dart';
import 'package:islami/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsScreenArgs arg =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsScreenArgs;
    if (verses.isEmpty) readFile(arg.index + 1);
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackgroundImage()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              arg.name,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  elevation: 12,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return VerseWidget(verses[index], index + 1);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (_, __) {
                      return Container(
                        color: Theme.of(context).accentColor,
                        height: 1,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 64),
                      );
                    },
                  ),
                ),
        ));
  }

  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String> lines = fileContent.trim().split('\n');

    setState(() {
      verses = lines;
    });
  }
}
