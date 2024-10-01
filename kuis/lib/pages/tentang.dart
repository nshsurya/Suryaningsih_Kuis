// lib/tentang_bank_sampah_keliling_page.dart
import 'package:flutter/material.dart';


class Tentang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Bank Sampah Keliling',
        style: TextStyle(color: Color.fromARGB(255, 77, 10, 61)),),
      ),
      body: Container (
        constraints: BoxConstraints.expand(),
          color: const Color.fromARGB(255, 236, 212, 234),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Menambahkan Gambar di atas Form Login
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                   child: Image.asset(
                   'assets/home/header.png', 
                    //width: 180,
                    height: 200,
                    fit: BoxFit.contain,
                    
                  ),
                ),
                
         Padding(
         padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
          child: Text(
            'Bank sampah keliling adalah inisiatif yang bertujuan untuk meningkatkan partisipasi masyarakat dalam pengelolaan sampah dan pencegahan pencemaran lingkungan. Biasanya dilaksanakan oleh komunitas atau organisasi non-pemerintah, bank sampah keliling menggunakan kendaraan khusus untuk mengumpulkan sampah dari rumah ke rumah atau dari lokasi yang telah ditentukan.\n\n'
            'Setelah dikumpulkan, sampah tersebut dibersihkan, dipilah, dan diolah menjadi bahan daur ulang. Melalui bank sampah keliling, masyarakat diberikan kesempatan untuk berpartisipasi aktif dalam menjaga lingkungan sekaligus memperoleh insentif berupa hadiah atau uang sebagai imbalan dari sampah yang mereka berikan.\n\n'
            'Dengan demikian, bank sampah keliling memiliki peran penting dalam mengedukasi masyarakat tentang pentingnya pengelolaan sampah yang berkelanjutan dan membantu mengurangi jumlah sampah yang masuk ke tempat pembuangan akhir.',
           
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
              ]
            )
    ),
      ),
    );
  }
}
