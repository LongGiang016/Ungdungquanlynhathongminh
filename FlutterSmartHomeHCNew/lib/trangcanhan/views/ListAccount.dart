import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'Acount.dart';

class ListAcout extends StatefulWidget {
  const ListAcout({super.key});

  @override
  State<ListAcout> createState() => _ListAcoutState();
}

class _ListAcoutState extends State<ListAcout> {
  int? Quyen;
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Users');
  final user = FirebaseAuth.instance.currentUser!;
CollectionReference _referencesUserList= FirebaseFirestore.instance.collection("Users");
late Stream <QuerySnapshot>_streamUser;
  
  initState() {
    
     _streamUser = _referencesUserList.snapshots();
    
    super.initState();
     getData();
  }
  
 

  Future<void> getData() async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot =
          await _collectionRef.where('Email', isEqualTo: user.email).get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
           var data = doc.data() as Map<String, dynamic>;
          print('Document data: ${doc.data()}');
         
          int quyen = data['Quyen'];
          

          setState(() {
           
            Quyen = quyen;
           ;
          });
        }
      } else {
        print('Document does not exist on the database');
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    
    Color iconColor = Quyen == 0 ? Colors.red : Color(0xFF31966B);
    _referencesUserList.get();
    _referencesUserList.snapshots();
    return Container(
      height: 150,
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
          left: BorderSide(width: 0.5, color: Colors.grey),
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
        

      ),
      child:
     StreamBuilder<QuerySnapshot>(
      stream:_streamUser, 
      builder:(BuildContext context , AsyncSnapshot snapshot)
      {
        if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        if(snapshot.connectionState == ConnectionState.active){
          QuerySnapshot querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot> listQueryDocumentSnapShot = querySnapshot.docs;
          return ListView.builder(
            itemCount:  listQueryDocumentSnapShot.length,
            itemBuilder: (context , index){
              QueryDocumentSnapshot document = listQueryDocumentSnapShot[index];
              return Container(
      padding: const EdgeInsets.only(left: 3, right: 3),
      height: 30,
      decoration: const BoxDecoration(
          //border: Border.all(width: 0.5, color: Colors.grey)

          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(document["TenTaiKhoan"]),
           Icon(Icons.person, color: iconColor, size: 20),
        ],
      ),
    );
            },
            );

        }
        return CircularProgressIndicator();

      })
    );
  }
}