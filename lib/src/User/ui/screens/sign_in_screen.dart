import 'package:comic_app/src/widgets/button_blue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/gradiente_back.dart';
import '../../bloc/bloc_user.dart';
import '../../model/user.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{

  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = Provider.of<UserBloc>(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, snapshot) {
        if( !snapshot.hasData || snapshot.hasError ){
          return signInGoogleUI();
        } else {
          return TripsAppCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(){

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", 1000.0),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Welcome to travel App",
                  style: TextStyle(
                      fontSize: 37.0,,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),

                ButtonBlue(
                  text: "Login with Gmail",
                  width: 300.0,
                  height: 50.0,
                  //onPressed: signIn,
                  onPressed: (){
                    userBloc.signOut();
                    userBloc.signIn().then( (dynamic user) {
                      userBloc.updateUserData(UserModel(
                          uid: user.uid,
                          name: user.displayName,
                          photoURL: user.photoURL,
                          email: user.email
                      ));
                    });

                  },
                )

              ]
          )
        ],
      ),
    );
  }


}