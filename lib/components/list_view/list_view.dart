// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/login/login.dart';
import 'package:flutter_introduction_app_ard_grup/models/list_view.model.dart';
import 'package:flutter_introduction_app_ard_grup/providers/crud_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/providers/list_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customDialog.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customListTile.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/dialogWidgets/customAlertDialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../api/api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/global_utils.dart';
import '../../widgets/customInfoNotFound.dart';
import '../../widgets/customTaskListWidget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  State<ListScreen> createState() => _ListScreenState();
}

final apirepository = APIRepository();

ListViewProvider? listViewProvider;

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    final exampleList = Provider.of<ListViewProvider>(context, listen: false);

    exampleList.exampleListView.clear();
    exampleList.loadData(1);
    exampleList.initData(widget.pageController);
  }

  @override
  Widget build(BuildContext context) {
    int l = -1;
    final listViewProvider = Provider.of<ListViewProvider>(context);
    final crudProvider = Provider.of<CrudViewProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        CustomAlertDialog(context, () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => true);
        }, "Emin misiniz", "Çıkış Yapılacaktır", ArtSweetAlertType.info,
            "Tamam", "Vazgeç");
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: APPColors.Main.blue,
            title: Text("Listeleme"),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  CustomAlertDialog(context, () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                        (route) => true);
                  }, "Emin misiniz", "Çıkış Yapılacaktır",
                      ArtSweetAlertType.info, "Tamam", "Vazgeç");
                },
                icon: const Icon(Icons.home)),
            actions: [sayfaYenile()],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  pageCard(context, "Örnek Listeleme Ekranı", logoHeader()),
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
                                String formattedDate = "";
                                ListViewModel listElements =
                                    listViewProvider.exampleListView[i];
                                if (listElements.notificationDate
                                    .toString()
                                    .contains(".")) {
                                  DateTime dateTime =
                                      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS")
                                          .parse(listElements.notificationDate
                                              .toString());
                                  formattedDate =
                                      DateFormat("dd/MM/yyyy").format(dateTime);
                                } else {
                                  DateTime dateTime =
                                      DateFormat("yyyy-MM-ddTHH:mm").parse(
                                          listElements.notificationDate
                                              .toString());
                                  formattedDate =
                                      DateFormat("dd/MM/yyyy").format(dateTime);
                                }

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TaskListWidget(
                                        iconOnPressed: () {
                                          crudProvider.fillForm(
                                              context,
                                              listElements,
                                              listViewProvider.pageController!);
                                        },
                                        importanceLevelColor: generateColor(l),
                                        taskDate: formattedDate,
                                        taskNo: i.toString(),
                                        taskSubject:
                                            listElements.description == ""
                                                ? "Açıklama ${i + 1}"
                                                : listElements.description,
                                        taskPerson:
                                            listElements.isDelete == false
                                                ? "Silindi"
                                                : "Silinmedi",
                                        isIcon: true,
                                        taskProjectName:
                                            "Lorem ipsum dolor sit amet",
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.all(
                                    //       MediaQuery.of(context).size.height /
                                    //           80),
                                    //   child: AppListTileWithAvatar(
                                    //     icon: Icons.edit,
                                    //     onTap: () {
                                    //       crudProvider.fillForm(
                                    //           context,
                                    //           listElements,
                                    //           listViewProvider.pageController!);
                                    //     },
                                    //     iconColor: generateColor(l),
                                    //     iconText: i.toString(),
                                    //     extraTitle: formattedDate,
                                    //     extraTitleHeight: 25,
                                    //     title: listElements.description == ""
                                    //         ? "Açıklama ${i + 1}"
                                    //         : listElements.description,
                                    //     subTitle:
                                    //         listElements.isDelete.toString(),
                                    //   ),
                                    // ),
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
                loadingBar(context, APPColors.Accent.grey, APPColors.Main.black)
              ],
            ],
          )),
    );
  }

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
          padding: EdgeInsets.all(height_18),
          child: Icon(Icons.refresh),
        ),
      );
    });
  }
}
