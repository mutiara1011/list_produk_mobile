import 'package:flutter/material.dart';
import 'package:list_produk_yaya/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => Register_Page_State();
}

class Register_Page_State extends State<Register_Page> {
  var passToggle = true;
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 35),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 206, 203, 203),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukan username",
                      labelText: "Username",
                      hintStyle: TextStyle() = GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 206, 203, 203),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukan email",
                      labelText: "Email",
                      hintStyle: TextStyle() = GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.email),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 206, 203, 203),
                  ),
                  child: TextFormField(
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukan Password",
                      labelText: "Password",
                      hintStyle: TextStyle() = GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(height: 50),
            Container(
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 120, vertical: 10),
                      backgroundColor: Color.fromARGB(255, 65, 84, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login_Page()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle() = GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have Account? ",
                  style: TextStyle() = GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login_Page();
                    }));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle() = GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color.fromARGB(235, 27, 44, 199),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
