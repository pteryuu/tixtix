import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tixtix/consts/faq.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/shared/theme.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/screen', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(backgroundColor: kRedColor, content: Text(state.err)));
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(context, '/sign-up', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoad) {
          return const Center(
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
              'FAQ',
              style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset("assets/poster-1.jpg"),
                  const Text("Menjawab pertanyaan seputar TIXTIX!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    thickness: 2,
                    height: 32,
                  ),
                  HtmlWidget(
                    faq,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
