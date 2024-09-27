import 'package:flutter/material.dart';

import '../auth/auth_service/google_sign.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight:FontWeight.bold

              )
            ),
            SizedBox(height: 16),
            Text(
              'Connectez vous',
              style : TextStyle(
              fontSize: 28,
              color : Colors.grey

              )
            ),
            SizedBox(height: 32,),
            providerButton('Google', 'assets/google-icon.svg'),
            SizedBox(height: 16),
            providerButton('Microsoft', 'assets/microsoft-icon.svg'),
            SizedBox(height: 16),
            providerButton('Apple', 'assets/apple-icon.svg'),


          ]
        ) 
      ,)
      

    );

  }
}


Widget providerButton(String providerName, String logoPath){
  return  ElevatedButton(onPressed:(){

  },
  style:  ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)
    ),
    padding: EdgeInsets.symmetric(vertical: 16),
    backgroundColor: Color(0xFFF1F1F1),
    
  ),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(logoPath, height:24),
      SizedBox(width:4),
      Text(
        'Connectez-vous avec $providerName',
        style: TextStyle(
          color: Colors.black

        ),
      )
    ],
   ));
}
