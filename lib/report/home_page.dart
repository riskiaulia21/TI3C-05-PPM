import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstfirebase/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore
  final FirestoreService firestoreService = FirestoreService();

  //text controller
  final TextEditingController textController = TextEditingController();

  void openFurqanBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                //button save
                ElevatedButton(
                  onPressed: () {
                    //add new
                    firestoreService.addfurqan(textController.text);

                    //clear the text controller
                    textController.clear();

                    //close the box
                    Navigator.pop(context);
                  },
                  child: const Text("Add lah bang"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar
        //(((centertitle untuk membuat posisi title berada di tengah)))
        flexibleSpace: const Center(
          child: Text(
            "Furqan",
            style: TextStyle(
              color: Colors.blue, // Sesuaikan dengan warna teks yang sesuai
              fontSize: 20.0, // Sesuaikan ukuran teks jika diperlukan
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Aksi ketika tombol ditekan
        onPressed: openFurqanBox,

        // Icon pada tombol
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Mengambil data dari Firestore
        stream: firestoreService.getfurqanStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilan ketika sedang memuat
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Tampilan jika ada error
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text(

                // Tampilan jika tidak ada data
                'No data available');
          } else {
            // Proses normal jika data ada dan tidak null
            List<DocumentSnapshot> furqanList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: furqanList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = furqanList[index];
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String furqanText = data['furqan'];
                return ListTile(
                  title: Text(furqanText),
                );
              },
            );
          }
        },
      ),
    );
  }
}
