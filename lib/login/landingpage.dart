import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/roundbutton.dart';
import 'package:lifetrack_to_do_app/component/textbutton.dart';
import 'package:lifetrack_to_do_app/login/login.dart';
import 'package:lifetrack_to_do_app/login/signup.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                height: (height / 4) * 3,
                width: width,
                color: const Color(0xFFff4f5a),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: (((height / 4) * 3) / 3) * 2,
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage('assets/logo.png'),
                        width: 150,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/lines.png'),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          RoundButton(
            bgColor: const Color(0xFFff4f5a),
            textColor: Colors.white,
            text: "Sign Up",
            action: () {
              Navigator.of(context).push(_createRouteSignUp());

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SignUpPage(),
              //   ),
              // );
            },
            fsize: 12,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          CTextButton(
            text: "Login",
            action: () {
              Navigator.of(context).push(_createRouteLogin());
            },
            size: 12,
          ),
        ],
      ),
    );
  }
}

//          Column(
//             children: const [
//               Image(
//                 image: AssetImage('assets/logo.png'),
//               ),
//               Image(
//                 image: AssetImage('assets/lines.png'),
//               ),
//             ],
//           ),

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double w = size.width;
    // double h = size.height;

    // final path = Path();
    // path.moveTo(0, 0);
    // path.lineTo(0, h);
    // path.quadraticBezierTo(w * 0.65, h + 100, w, h);
    // path.lineTo(w, 0);
    // path.close();

    Path path0 = Path();
    path0.moveTo(size.width * 0, size.height * 0);
    path0.lineTo(size.width * 0, size.height * 0.85);
    path0.quadraticBezierTo(
        size.width * 0.35, size.height * 1, size.width * 0.55, size.height * 1);
    path0.quadraticBezierTo(
        size.width * 0.85, size.height * 1, size.width * 1, size.height * 0.9);
    path0.lineTo(size.width * 1, size.height * 0);
    path0.close();

    return path0;
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

Route _createRouteLogin() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
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
