// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/login/login.dart';
import 'package:flutter_introduction_app_ard_grup/models/list_view.model.dart';
import 'package:flutter_introduction_app_ard_grup/providers/list_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customListTile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../api/api_repository.dart';
import '../../utils/global_utils.dart';
import '../../widgets/customInfoNotFound.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

final apirepository = APIRepository();
final ScrollController _scrollController = ScrollController();

ListViewProvider? listViewProvider;

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    // listViewProvider = ListViewProvider();
    // listViewProvider!.setisDataLoading = true;
    // listViewProvider!.setloading = true;
    // listViewProvider!.setisDataExist = false;
    // listViewProvider!.exampleListView.clear();
    // listViewProvider!.setcurrentPage = 1;
    // setState(() {
    //   listViewProvider!.loadData(listViewProvider!.currentPage);
    // });
    super.initState();
    final postMdl = Provider.of<ListViewProvider>(context, listen: false);
    postMdl.exampleListView.clear();
    postMdl.loadData(1);
  }

  @override
  Widget build(BuildContext context) {
    int l = -1;
    final listViewProvider = Provider.of<ListViewProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (route) => false);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Listeleme"),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
                },
                icon: const Icon(Icons.home)),
            actions: [sayfaYenile()],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  pageCard(
                      context,
                      "Örnek Listeleme Ekranı",
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                              "lib/assets/images/ardgrup_logo.png"))),
                  !listViewProvider.isDataExist
                      ? Expanded(
                          child: NotificationListener<ScrollNotification>(
                          onNotification:
                              listViewProvider.notificationController,
                          child: ListView.builder(
                              itemCount:
                                  listViewProvider.exampleListView.length,
                              itemBuilder: (BuildContext context, int i) {
                                l++;
                                if (l == 5) {
                                  l = 0;
                                }
                                ListViewModel listElements =
                                    listViewProvider.exampleListView[i];

                                DateTime dateTime =
                                    DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(
                                        listElements.notificationDate
                                            .toString());
                                String formattedDate =
                                    DateFormat("dd/MM/yyyy").format(dateTime);
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height /
                                              80),
                                      child: AppListTileWithAvatar(
                                        icon: null,
                                        iconColor: generateColor(l),
                                        transactionIcon: i.toString(),
                                        transactionAmount: formattedDate,
                                        transactionAmountHeight: 40,
                                        transactionName:
                                            listElements.description == ""
                                                ? "Açıklama ${i + 1}"
                                                : listElements.description,
                                        transactionType:
                                            listElements.isDelete.toString(),
                                      ),
                                    ),
                                    customDivider(0)
                                  ],
                                );
                              }),
                        ))
                      : Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2.5),
                          child: const Center(child: AramaSonucBos()),
                        ),
                ],
              ),
              if (listViewProvider.isDataLoading == true) ...[
                loadingBar(
                    context, Color.fromARGB(102, 255, 255, 255), Colors.black)
              ],
            ],
          )),
    );
  }

  // bool _notificationController(ScrollNotification scrollInfo) {
  //   if (listViewProvider!.isDataLoading &&
  //       scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
  //     if (listViewProvider!.toplamKayitSayisi != null &&
  //         listViewProvider!.exampleListView.length >=
  //             listViewProvider!.toplamKayitSayisi) {
  //       return false;
  //     }
  //     listViewProvider!.setcurrentPage = 1 + listViewProvider!.currentPage;
  //     listViewProvider!.loadData(listViewProvider!.currentPage);
  //     setState(() {
  //       listViewProvider!.setisDataLoading = true;
  //     });
  //   } else {}
  //   return false;
  // }

  Widget sayfaYenile() {
    return Consumer<ListViewProvider>(
        builder: (context, listViewProvider, child) {
      return InkWell(
        onTap: () {
          setState(() {
            listViewProvider.setisDataLoading = true;
            listViewProvider.exampleListView.clear();
            listViewProvider.setcurrentPage = 1;
            listViewProvider.loadData(listViewProvider.currentPage);
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(Icons.refresh),
        ),
      );
    });
  }
}
