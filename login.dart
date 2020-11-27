import 'package:mobile_uts/beranda.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nama = "100";
  int nohp = 13;
  String alamat = "500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(8),
            color: Colors.white54,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: 280,
                    height: 100,
                    child: Center(
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Kalkulator Investasi",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (String txt) {
                      setState(() {
                        nama = txt;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 25,
                      ),
                      hintText: "Nama Anda",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Nama Anda",
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (String txt) {
                      setState(() {
                        nohp = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 25,
                        ),
                        hintText: "Nomor HP",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Nomor HP",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (String txt) {
                      setState(() {
                        alamat = txt;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.location_city,
                          size: 25,
                        ),
                        hintText: "ALAMAT",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "ALAMAT",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SIForm()),
                        );
                      },
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      color: Colors.grey,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 30, bottom: 80),
                    color: Colors.white,
                  ),
                ]),
          )),
    );
  }

}