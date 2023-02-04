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

import '../../widgets/customDropdown.dart';

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  @override
  void initState() {
    super.initState();
    final crudP = Provider.of<CrudViewProvider>(context, listen: false);
    crudP.initForm();
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
              pageCard(context, "Örnek Kayıt Ekleme Ekranı", logoHeader()),
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
                      colors: APPColors.Secondary.orange,
                      height: height_18,
                      name: "Ekle",
                      icons: Icon(
                        Icons.add,
                        color: APPColors.Main.white,
                      ),
                      onTap: () => crudProvider.addForm(context),
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
