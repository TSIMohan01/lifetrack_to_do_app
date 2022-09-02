import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/roundbutton.dart';
import 'signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: (height / 4) * 2,
                width: width,
                color: const Color(0xFFff4f5a),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('assets/linetop.png'),
                      width: 85,
                    ),
                    Container(
                      height: (height / 6) * 1,
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage('assets/logo.png'),
                        width: 200,
                      ),
                    ),
                    const Align(
                      child: Text(
                        "Welcome aboard,",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Align(
                      child: Text(
                        "Adam",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Text(
              "Reach your goals faster and keep your\npersonal and proffesional life in order",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            RoundButton(
              bgColor: Color(0xFFff4f5a),
              textColor: Colors.white,
              text: "Get started",
              action: () {
                print("Clicked");
              },
              fsize: 12,
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.73);
    path.quadraticBezierTo(w * 0.5, h + 10, w, h * 0.73);
    path.lineTo(w, 0);
    path.close();

    // Path path0 = Path();
    // path0.moveTo(size.width * 0, size.height * 0);

    // path0.lineTo(size.width * 0, size.height * 0.75);

    // path0.quadraticBezierTo(size.width * 0.3195312, size.height * 0.3128906,
    //     size.width * 0.5000000, size.height * 0.3125000);

    // path0.quadraticBezierTo(size.width * 0.7859375, size.height * 0.3132813,
    //     size.width * 1, size.height * 0.75);

    // path0.lineTo(size.width * 0.9968750, size.height * 0.0015625);

    // path0.lineTo(size.width * 1, size.height * 0);

    // path0.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Route _createRouteSignUp() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
