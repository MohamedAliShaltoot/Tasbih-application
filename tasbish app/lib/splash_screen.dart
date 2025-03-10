import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
       Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const HomeScreen();
                    }));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SizedBox(
              width: 200,
              height: 200,
              child:Image.asset("tasbish app/assets/images/ic_sebha.png"),
              
              
              )
          ],
        ),
      ),
    );
  }
}
