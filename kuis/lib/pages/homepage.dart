// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:kuis/pages/dummy_data.dart';
import 'package:kuis/pages/tentang.dart';
import 'loginpage.dart'; // Import LoginPage untuk logout

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, $username',
            style: TextStyle(
            color: Colors.white,
            ),),
        backgroundColor: Color.fromARGB(255, 77, 10, 61), // Tambahkan warna latar belakang
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white,),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 77, 10, 61),
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              '  Selamat datang di aplikasi Bank Sampah!',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card "Apa itu Bank Sampah Keliling?"
            _InfoCard(
              title: 'Apa itu Bank Sampah Keliling?',
              icon: Icons.info,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tentang()),
                );
              },
            ),
            const SizedBox(height: 20),
            // List Jadwal Pengambilan Sampah
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Jadwal Pengambilan Sampah:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  final schedule = scheduleList[index];
                  return _ScheduleCard(schedule: schedule);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // Kembali ke LoginPage dan menghapus semua halaman sebelumnya
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _InfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: const Color.fromARGB(255, 150, 0, 122), size: 30),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 150, 0, 122)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  const _ScheduleCard({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            schedule.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.red);
            },
          ),
        ),
        title: Text(
          schedule.wasteBankName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Area: ${schedule.coverageArea}'),
              Text('Tanggal: ${schedule.implementationDate}'),
              Text('Waktu: ${schedule.startTime} - ${schedule.endTime}'),
            ],
          ),
        ),
      ),
    );
  }
}
