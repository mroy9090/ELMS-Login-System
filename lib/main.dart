import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.amber
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        fit: StackFit.expand,
        children: [
          Image(
              image: new AssetImage("assets/uiu.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterLogo(
                size: _iconAnimation.value *200.0,
              )
            ],
          ),
          Form(child: Theme(
            data: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.lightGreen,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.white,fontSize: 20.0)
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(45.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "ENTER EMAIL",labelText: "ENTER EMAIL"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "ENTER PASSWORD",labelText: "ENTER PASSWORD"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 20.0)),
                  MaterialButton(onPressed: () => {} ,color: Colors.blue,textColor: Colors.white,child: Text("Login"),)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}





