import 'package:flutter/material.dart';
import 'package:music_box/utils/sp_util.dart';

class SearchBarDelegate extends SearchDelegate {
  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    if (query == "") {
      return;
    }
    const sufix = "asdasdas56";
    var data = [];
    var history = SpUtil.getString("histry");
    history ??= "";
    data = history.split(sufix);

    while (data.length >= 10) {
      data.removeAt(0);
    }
    if (!data.contains(query)) {
      data.add(query);
      SpUtil.putString("histry", data.join(sufix).toString());
    }

    SpUtil.putString("search", query);
    Navigator.of(context).pop(query);
  }

  // 搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。 当点击图片时，清空搜索的内容。
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.blue,
        icon: const Icon(Icons.clear),
        onPressed: () => {
          if (query == "") {close(context, null)} else {query = ""}
        },
      )
    ];
  }

  // 搜索栏左侧的图标和功能，点击时关闭整个搜索页面
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.blue,
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () => close(context, null),
    );
  }

  // 搜索到内容了
  @override
  Widget buildResults(BuildContext context) {
    //缓存下来记录
    return Center(
      child: Container(
        child: Card(
          color: Colors.redAccent,
          child: Text(query),
        ),
      ),
    );
  }

  // 输入时的推荐及搜索结果
  @override
  Widget buildSuggestions(BuildContext context) {
    const sufix = "asdasdas56";
    var history = SpUtil.getString("histry");
    history ??= "";
    var searchHistory = history
        .split(sufix)
        .reversed
        .where((element) => element != '')
        .toList();

    final suggestionList = query.isEmpty
        ? searchHistory
        : [].where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.isEmpty ? 0 : suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: const TextStyle(color: Colors.grey))
              ]),
        ),
      ),
    );
    ;
  }
}
