import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  // Fungsi pembuka URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('My Profile'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              height: 220,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.9), width: 3),
                            boxShadow: [
                              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), blurRadius: 8, offset: Offset(0, 4)),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 52,
                            backgroundImage: AssetImage('avatar.JPG'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('Muhammad Ade Dzakwan', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        const Text('Fullstack Developer | 5026231154', style: TextStyle(color: Color.fromRGBO(255,255,255,0.9), fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bio card
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(height: 8),
                        Text(
                          'Seorang mahasiswa Sistem Informasi dengan passion dalam Bidang Pengembangan web, Pengembangan Perangkat Lunak, dan Kecerdasan Buatan, menggabungkan keahlian teknis dengan keterampilan komunikasi yang kuat. Kemampuan terbukti untuk unggul dalam lingkungan tim, berkolaborasi secara efektif untuk mencapai tujuan bersama. Dikenal karena menangani tanggung jawab dengan teliti dan dapat diandalkan, saya membawa pendekatan dinamis dalam memecahkan masalah dalam dunia pemrograman.',
                          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  _statItem(Icons.group, 'Work Experience', '1+ Year', Colors.orange),
                  const SizedBox(width: 12),
                  _statItem(Icons.my_library_books, 'GPA', '3.64/4.00', Colors.green),
                  const SizedBox(width: 12),
                  _statItem(Icons.work_outline, 'Projects', '10+', Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Skills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Skills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      Chip(label: Text('React')),
                      Chip(label: Text('Vue.js')),
                      Chip(label: Text('Next.js')),
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('Firebase')),
                      Chip(label: Text('REST APIs')),
                      Chip(label: Text('UI/UX')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchUrl('https://github.com/nawa316'),
                      icon: const Icon(Icons.person_add),
                      label: const Text('Follow'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _launchUrl('https://wa.me/6289513601357'),
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Projects sample
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Projects', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _projectCard('My profile website', Colors.indigo),
                        const SizedBox(width: 12),
                        _projectCard('Catalog product website', Colors.teal),
                        const SizedBox(width: 12),
                        _projectCard('Notification website', Colors.deepOrange),
                        const SizedBox(width: 12),
                        _projectCard('Contacts App', Colors.teal),
                        const SizedBox(width: 12),
                        _projectCard('FundUp website', Colors.deepOrange),
                        const SizedBox(width: 12),
                        _projectCard('shareITS website', Colors.indigo),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Contact
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _contactItem(Icons.mail, 'Email', 'muhammadadedzakwan@gmail.com'),
                      _contactItem(Icons.phone, 'Phone', '+62 895 1360 1357'),
                      _contactItem(Icons.web, 'Website', 'muhammadadedzakwan.vercel.app'),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _contactItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  Widget _statItem(IconData icon, String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.04), blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            CircleAvatar(radius: 14, backgroundColor: color.withOpacity(0.12), child: Icon(icon, size: 16, color: color)),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color)),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _projectCard(String title, Color color) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.08), blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text('Flutter • UI', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
