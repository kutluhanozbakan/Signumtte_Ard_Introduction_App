// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/providers/crud_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/utils/global_utils.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/buttonWidgets/customIconButton.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/textfieldsWidgets/customTextFormField.dart';
import 'package:provider/provider.dart';

import '../../models/list_view.model.dart';
import '../../widgets/customDropdown.dart';

class CrudView extends StatefulWidget {
  const CrudView(
      {super.key, required this.listElements, required this.pageController});

  final ListViewModel listElements;
  final PageController pageController;

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  @override
  void initState() {
    final crudP = Provider.of<CrudViewProvider>(context, listen: false);

    if (widget.listElements.id != 0) {
      crudP.initForm(widget.listElements);
    } else {
      crudP.initForm();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final crudProvider = Provider.of<CrudViewProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: Text("Kayıt Ekle Güncelle"),
          backgroundColor: APPColors.Main.blue,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: crudProvider.crudFormKey,
            child: Column(
              children: [
                pageCard(
                    context,
                    "Örnek Kayıt ${crudProvider.isUpdateActivated ? 'Güncelleme' : 'Ekleme'} Ekranı",
                    logoHeader()),
                Padding(
                  padding: const EdgeInsets.all(height_14),
                  child: Column(
                    children: [
                      CustomTextFormField(
                          // ignore: sort_child_properties_last
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: mainWhiteColor,
                                  borderRadius:
                                      BorderRadius.circular(radius_size_10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: container_box_shadow,
                                        blurRadius: radius_size_10,
                                        offset: Offset(
                                            radius_size_0, radius_size_10))
                                  ]),
                              child: CustomTextFormFieldContent(
                                  icon: Icons.text_format,
                                  iconColor: APPColors.Secondary.blue,
                                  validator: formBos,
                                  controller:
                                      crudProvider.descriptionController,
                                  name: "Bildirim İsmi"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: mainWhiteColor,
                                  borderRadius:
                                      BorderRadius.circular(radius_size_10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: container_box_shadow,
                                        blurRadius: radius_size_10,
                                        offset: Offset(
                                            radius_size_0, radius_size_10))
                                  ]),
                              child: CustomTextFormFieldContent(
                                  icon: Icons.date_range,
                                  isSuffix: false,
                                  isDate: true,
                                  validator: formBos,
                                  isTime: true,
                                  controller:
                                      crudProvider.descriptionDateController,
                                  name: "Bildirim Tarihi"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: mainWhiteColor,
                                  borderRadius:
                                      BorderRadius.circular(radius_size_10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: container_box_shadow,
                                        blurRadius: radius_size_10,
                                        offset: Offset(
                                            radius_size_0, radius_size_10))
                                  ]),
                              child: Column(
                                children: [
                                  CustomDropdown(
                                    onChanged: (val) {
                                      crudProvider
                                              .setdescriptionReadedController =
                                          val!;
                                      if (crudProvider
                                          .descriptionReadedController
                                          .text
                                          .isNotEmpty) {
                                        crudProvider.setIsKurumTuruEmpty =
                                            false;
                                      } else {
                                        crudProvider.setIsKurumTuruEmpty = true;
                                      }
                                    },
                                    disableClear: true,
                                    icons: Icons.notification_add,
                                    listHeight: 2,
                                    controller: crudProvider
                                        .descriptionReadedController,
                                    header: "Bildirim Durumu",
                                    items: ["Evet", "Hayır"],
                                  ),
                                  crudProvider.iskurumTuruEmpty
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      19,
                                                  bottom: 10),
                                              child: Text(
                                                "Bu alan boş olamaz",
                                                style: TextStyle(
                                                    color: APPColors.Main.red,
                                                    fontSize: height_12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                          sectionName: "Notification Bilgileri"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      colors: APPColors.Secondary.red,
                      height: height_18,
                      width: height_3,
                      name: "Temizle",
                      icons: Icon(
                        Icons.delete,
                        color: APPColors.Main.white,
                      ),
                      onTap: () => crudProvider.clearForm(),
                    ),
                    CustomIconButton(
                      colors: crudProvider.isUpdateActivated
                          ? APPColors.Secondary.orange
                          : APPColors.Main.blue,
                      height: height_18,
                      width: height_3,
                      name: crudProvider.isUpdateActivated
                          ? "Güncelle"
                          : "Kaydet",
                      icons: Icon(
                        Icons.add,
                        color: crudProvider.isUpdateActivated
                            ? APPColors.Secondary.white
                            : APPColors.Main.white,
                      ),
                      onTap: () => crudProvider.addOrUpdateForm(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
