import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/shared/theme.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  // String subyek = "";
  // String orderNumber = "";
  // String message = "";
  List<String?> screenshots = [null, null, null];

  final subyekController = TextEditingController();
  final orderNumberController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/screen', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: kRedColor, content: Text(state.err)));
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoad) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 1.0,
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Apa yang Bisa Kami Bantu?',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                  color: Colors.lightBlue.withOpacity(0.05),
                  child: Text(
                      "Hubungi layanan konsumen kami untuk mendapat bantuan transaksi atau penggunaan aplikasi"),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Input(
                        label: "SUBYEK",
                        req: true,
                        controller: subyekController,
                        hintText: "Apa yang dapat kami bantu?",
                      ),
                      SizedBox(height: 16),
                      Input(
                        label: "NOMOR ORDER",
                        tooltip:
                            "anda dapat menemukan nomor order dari halaman detail tiket.",
                        controller: orderNumberController,
                        hintText: "Masukkan nomor order anda...",
                      ),
                      SizedBox(height: 16),
                      Input(
                        label: "PESAN",
                        req: true,
                        controller: messageController,
                        hintText: "Masukkan pesan anda...",
                      ),
                      SizedBox(height: 16),
                      ImageInput(
                        screenshots: screenshots,
                        onChange: (val, idx) {
                          setState(() {
                            screenshots[idx] = val;
                          });
                        },
                      ),
                      SizedBox(height: 32),
                      Divider(color: Colors.grey),
                      Row(
                        children: [
                          Transform.translate(
                            offset: const Offset(2, -1),
                            child: const Text(
                              '*',
                              textScaleFactor: 1,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Text(
                            "Mohon untuk mengisi seluruh formulir.",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Kirim Email"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(25, 43, 80, 1),
                          minimumSize: const Size.fromHeight(40), // NEW
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Kami akan membalas email anda sesegera mungkin pada jam operasional yaitu 07:00 sampai dengan 22:00 WIB",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, height: 1.5),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: Text("Layanan Pengaduan Konsumen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text("TIXTIX Customer Support",
                            style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ImageInput extends StatefulWidget {
  List<String?> screenshots;
  void Function(String? val, int idx) onChange;
  ImageInput({Key? key, required this.screenshots, required this.onChange})
      : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TANGKAPAN LAYAR"),
          SizedBox(height: 8),
          Text(
            "Untuk respon yang lebih baik, anda dapat menyelipkan screenshot yang menampilkan masalah di aplikasi",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ...widget.screenshots.asMap().entries.map(
                    (item) => ImagePickerWidget(
                      image: item.value,
                      onPick: (val) => widget.onChange(val, item.key),
                      onDelete: () => widget.onChange(null, item.key),
                    ),
                  )
            ],
          )
        ],
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  String? image;
  void Function(String path) onPick;
  void Function() onDelete;
  ImagePickerWidget(
      {Key? key, this.image, required this.onPick, required this.onDelete})
      : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  void pick() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      widget.onPick(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.image != null) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: widget.onDelete,
              child: Image.file(
                File(widget.image!),
                width: 80,
                height: 80,
              ),
            ),
          ),
          // Positioned(
          //   top: -12,
          //   right: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     color: Colors.red,
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.close, color: Colors.white, size: 20),
          //     ),
          //   ),
          // ),
        ],
      );
    }
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: pick,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.2), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  bool req;
  String label;
  TextEditingController controller;
  String hintText;
  String? tooltip;
  // void Function(String val) onChange;

  Input({
    Key? key,
    this.req = false,
    required this.label,
    required this.controller,
    required this.hintText,
    this.tooltip,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Text(widget.label),
            widget.req
                ? Transform.translate(
                    offset: const Offset(2, -1),
                    child: const Text(
                      '*',
                      textScaleFactor: 1,
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox(),
            widget.tooltip != null
                ? Tooltip(
                    triggerMode: TooltipTriggerMode.tap,
                    verticalOffset: -40,
                    waitDuration: const Duration(seconds: 1),
                    showDuration: const Duration(seconds: 10000),
                    padding: const EdgeInsets.all(5),
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black),
                    message: widget.tooltip,
                    child: Image.asset('assets/question.png',
                        width: 16, height: 16),
                  )
                : const SizedBox()
          ],
        ),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ]),
    );
  }
}
