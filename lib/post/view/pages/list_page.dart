// list_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post/controller/post_table_controller.dart';
import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:provider/provider.dart';

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PostTableController>();

    useEffect(() {
      controller.setPostDTOTableList();
    }, []);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: controller.postDTOTableList?.map((e) => ListItem(postDTOTable: e)).toList() ?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable;

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Column(
        children: [
          Text("[ ${postDTOTable.movieNm} ]"),
          Divider(),
          Text("랭킹 : ${postDTOTable.rank} 위"),
          Divider(),
          Text("관객 : ${postDTOTable.audiCnt} 명"),
          Divider(),
          Text("개봉 : ${postDTOTable.openDt}"),
        ],
      ),
    );
  }
}