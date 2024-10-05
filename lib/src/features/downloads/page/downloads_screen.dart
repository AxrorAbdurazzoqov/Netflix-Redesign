import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/constants/font_style/font_style_const.dart';
import 'package:netflix_clone/src/core/repository/hive_service.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsScreen> {
  late List listDownloads;

  @override
  void initState() {
    super.initState();
    listDownloads = [];
    HiveService.instantiate.readAllData.forEach(
      (key, value) {
        listDownloads.add(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: listDownloads.isEmpty
          ? Center(
              child: Text(
                'No downloads yet',
                style: FontStyleConst.big,
              ),
            )
          : SafeArea(
            child: ListView.builder(
                itemCount: listDownloads.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(CupertinoIcons.film),
                    title: Text(listDownloads[index].model.title),
                    trailing: IconButton(
                        onPressed: () {
                          HiveService.instantiate.deleteData(key: listDownloads[index].model.title);
                          setState(() {
                            listDownloads.removeAt(index);
                          });
                        },
                        icon: const Icon(CupertinoIcons.trash)),
                  );
                },
              ),
          ),
    );
  }
}
