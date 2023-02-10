import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'controllerLogin.dart';

final GoogleSignIn gSignIn = GoogleSignIn();

class GsignIn extends StatefulWidget {
  const GsignIn({Key? key}) : super(key: key);

  @override
  State<GsignIn> createState() => _GsignInState();
}

class _GsignInState extends State<GsignIn> {

  loginUIController()
  {
    return Consumer<ControllerLogin>(
        builder: (context, model, child){
          if(model.userDetailsModel != null)
          {
            return Center(
              child: allReadyLoggedInScreen(model)

            );
          }
          else
          {
            return notLoggedInScreen();
          }
        }
    );
  }

  allReadyLoggedInScreen(ControllerLogin model)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetailsModel!.photoUrl ?? "").image,
          radius: 100,
        )
      ],
    );
  }



  notLoggedInScreen()
  {
    return Center(
      child:
      Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
              child:

                  GestureDetector(
                    onTap: (){
                      Provider.of<ControllerLogin>(context, listen: false).allowUserToLogin();
                    },
                    child:
                    Image.asset("assets/images/gsignin.png"),)
          ),

        ],
      )

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:
         loginUIController()

    );
  }
}
