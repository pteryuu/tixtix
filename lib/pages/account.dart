import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/cubit/auth_cubit.dart';
import 'package:tixtix/shared/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
            backgroundColor: Colors.white,
            title: Text(
              'Akun',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Input(label: "NAMA LENGKAP", value: "Pieter Yu"),
              Divider(
                color: Colors.grey,
                height: 40,
              ),
              Input(label: "NOMOR HANDPHONE", value: "+6285158486659"),
              Divider(
                color: Colors.grey,
                height: 40,
              ),
              Input(label: "PASSWORD", value: "********"),
            ]),
          ),
        );
      },
    );
  }
}

class Input extends StatelessWidget {
  String label;
  String value;
  Input({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text("EDIT", style: TextStyle(fontSize: 10)),
                ),
              )
            ],
          ),
          const Divider(
            height: 12,
            thickness: 0,
            color: Colors.transparent,
          ),
          Text(value),
        ],
      ),
    );
  }
}
