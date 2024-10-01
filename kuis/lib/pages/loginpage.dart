import 'package:flutter/material.dart';
import 'homepage.dart'; // Pastikan file ini ada dan benar

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Mengabaikan peringatan library_private_types_in_public_api
class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  bool isPasswordVisible = false; // Variabel untuk mengontrol visibilitas password

  Future<void> _navigateToHome() async {
    // Menunggu selama 2 detik (misalnya untuk menampilkan splash screen atau loading)
    await Future.delayed(Duration(seconds: 2));

    // Navigasi ke HomePage dan menggantikan halaman saat ini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage(username: username)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 77, 10, 61),
          title: Text(
            "Halaman Login",
            style: TextStyle(
            color: Colors.white,
            ),
          ),
          centerTitle: true, // Menengahkan judul AppBar
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: const Color.fromARGB(255, 236, 212, 234),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Menambahkan Gambar di atas Form Login
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                   child: Image.asset(
                   'assets/images/login.png', // Ganti dengan URL gambar yang Anda inginkan
                    //width: 180,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color.fromARGB(255, 77, 10, 61),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _usernameField(),
                _passwordField(),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            username = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color.fromARGB(255, 77, 10, 61)),
          ),
          prefixIcon: Icon(Icons.person,
          color: Color.fromARGB(255, 77, 10, 61),),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        obscureText: !isPasswordVisible, // Mengontrol visibilitas password
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color.fromARGB(255, 77, 10, 61)),
          ),
          prefixIcon: Icon(Icons.lock,
           color: Color.fromARGB(255, 77, 10, 61)),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color.fromARGB(255, 77, 10, 61),
            ),
  
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible; // Toggle visibility
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 77, 10, 61)),
),
        onPressed: () {
          if (username == 'suryaningsih' && password == 'kuis') {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("LOGIN BERHASIL")),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password Salah")),
            );
          }
        },
        child: const Text('LOGIN'),
      ),
    );
  }
}
