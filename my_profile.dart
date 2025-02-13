import 'package:flutter/material.dart';
import 'package:flutter_login/entity/profile.dart';
import 'package:flutter_login/utils/api_service.dart';

class MyProfile extends StatefulWidget {
  final String token; // Nhận token từ màn hình trước

  const MyProfile({super.key, required this.token});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late Future<Profile> _profileFuture;

  @override
  void initState() {
    super.initState();
    var api = ApiService();
    _profileFuture =
        api.get_profile(widget.token); // Gọi hàm getProfile khi trang được tạo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: FutureBuilder<Profile>(
        future: _profileFuture, // Dữ liệu được lấy từ API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Hiển thị loading khi đang tải
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Hiển thị lỗi nếu có
          } else if (snapshot.hasData) {
            var profile = snapshot.data!; // Lấy dữ liệu profile từ snapshot
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FirstName: ${profile.firstName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'LastName: ${profile.lastName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'MaidenName: ${profile.maidenName}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
