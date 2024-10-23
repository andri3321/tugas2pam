import 'package:flutter/material.dart';

class MemberList extends StatelessWidget {
  const MemberList({super.key});

  // Daftar anggota dengan nama dan ID
  final List<Map<String, String>> members = const [
    {
      'name': 'Andri Sheva Ramadhani',
      'id': '124220036',
    },
    {
      'name': 'Andreas Natan',
      'id': '124220000',
    },
    {
      'name': 'Yosua Bangun',
      'id': '124220000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 50), // Spasi di atas untuk margin dari bagian atas layar
          const Center(
            child: Text(
              'Daftar Anggota',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 20), // Spasi antara judul dan daftar
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: members.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4, // Mengatur bayangan untuk efek 3D
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        members[index]['name']![
                            0], // Mengambil huruf pertama sebagai avatar
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      members[index]['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('NIM: ${members[index]['id']}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Tambahkan aksi ketika item di tap
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Detail Anggota'),
                            content: Text(
                                'Nama: ${members[index]['name']}\nNIM: ${members[index]['id']}'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Tutup'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
