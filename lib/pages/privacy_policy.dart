import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tixtix/consts/privacy_policy.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/shared/theme.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String locale = "id";
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
              'Kebijakan Privasi',
              style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                locale = "id";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: locale == "id"
                                  ? const Color.fromRGBO(25, 43, 80, 1)
                                  : Colors.transparent,
                              shadowColor: locale == "id" ? null : Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/id.svg", width: 20),
                                const SizedBox(width: 4),
                                Text("Indonesia",
                                    style: TextStyle(color: locale != "id" ? Colors.grey : null)),
                              ],
                            )),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: locale == "en"
                                  ? const Color.fromRGBO(25, 43, 80, 1)
                                  : Colors.transparent,
                              shadowColor: locale == "en" ? null : Colors.transparent,
                            ),
                            onPressed: () {
                              setState(() {
                                locale = "en";
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/us.svg", width: 20),
                                const SizedBox(width: 4),
                                Text("English",
                                    style: TextStyle(color: locale != "en" ? Colors.grey : null)),
                              ],
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  HtmlWidget(
                    locale == "id" ? privacyPolicyID : privacyPolicyEN,
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
