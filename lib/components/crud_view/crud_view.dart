// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/providers/crud_view_provider.dart';
import 'package:flutter_introduction_app_ard_grup/utils/global_utils.dart';
import 'package:flutter_introduction_app_ard_grup/utils/themes.dart';
import 'package:flutter_introduction_app_ard_grup/utils/utils.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/commons.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customIconButton.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/customTextFormField.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: crudProvider.crudFormKey,
          child: Column(
            children: [
              pageCard(
                  context,
                  "Örnek Kayıt ${crudProvider.isUpdateActivated ? 'Güncelleme' : 'Ekleme'} Ekranı",
                  logoHeader()),
              CustomTextFormField(
                  // ignore: sort_child_properties_last
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(height_14),
                      child: CustomTextFormFieldContent(
                          icon: Icons.text_format,
                          iconColor: APPColors.Secondary.blue,
                          validator: formBos,
                          controller: crudProvider.descriptionController,
                          name: "Bildirim İsmi"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(height_14),
                      child: CustomTextFormFieldContent(
                          icon: Icons.date_range,
                          isSuffix: false,
                          isDate: true,
                          validator: formBos,
                          isTime: true,
                          controller: crudProvider.descriptionDateController,
                          name: "Bildirim Tarihi"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(height_14),
                      child: CustomDropdown(
                        onChanged: (val) {
                          crudProvider.setdescriptionReadedController = val!;
                          if (crudProvider
                              .descriptionReadedController.text.isNotEmpty) {
                            crudProvider.setIsKurumTuruEmpty = false;
                          } else {
                            crudProvider.setIsKurumTuruEmpty = true;
                          }
                        },
                        disableClear: true,
                        icons: Icons.notification_add,
                        listHeight: 2,
                        controller: crudProvider.descriptionReadedController,
                        header: "Bildirim Durumu",
                        items: ["Evet", "Hayır"],
                      ),
                    ),
                    crudProvider.iskurumTuruEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 12),
                                child: Text(
                                  "Bu alan boş bırakılamaz",
                                  style: TextStyle(
                                      color: APPColors.Main.red,
                                      fontSize: height_12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                  sectionName: "Notification Bilgileri"),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / height_12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppIconButton(
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
                    AppIconButton(
                      colors: crudProvider.isUpdateActivated
                          ? APPColors.Secondary.orange
                          : APPColors.Main.blue,
                      height: height_18,
                      width: height_3,
                      name:
                          crudProvider.isUpdateActivated ? "Güncelle" : "Ekle",
                      icons: Icon(
                        Icons.add,
                        color: crudProvider.isUpdateActivated
                            ? APPColors.Secondary.white
                            : APPColors.Main.white,
                      ),
                      onTap: () => crudProvider.addOrUpdateForm(context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
