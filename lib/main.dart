import 'package:flutter/material.dart';
 
void main() {
   runApp(const MaterialApp(home: MyPage()));
 }

class MyPage extends StatefulWidget {
   const MyPage({super.key});
  @override
   State<MyPage> createState() => _MyPageState();
 }

class _MyPageState extends State<MyPage> {
   String message = 'ยังไม่ได้กดปุ่ม!';

  @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('GitHub Lab')),
       body: Center(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text(message),
             ElevatedButton(
               onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute<void>(
                     builder: (context) => const ProfilePage(),
                   ),
                 );
               },
               child: const Text('Press'),
             ),
           ],
         ),
       ),
     );
   }
 }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 72),
            const SizedBox(height: 12),
            const Text('Profile'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ย้อนกลับ'),
            ),
          ],
        ),
      ),
    );
  }
}
