import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final List<String> imageUrls = [
    'asset/img_1.png',
    'asset/img_2.png',
    'asset/img_3.png',
    // Thêm các URL ảnh khác vào đây
  ];

  CarouselController _carouselController = CarouselController();

  void _goToPreviousSlide() {
    _carouselController.previousPage();
  }

  void _goToNextSlide() {
    _carouselController.nextPage();
  }

  void _handleContinue() {
    // Điều hướng đến trang đăng nhập sau khi nhấn nút tiếp tục
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Thay thế LoginPage() bằng trang đăng nhập của bạn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Phần slide ảnh
          Expanded(
            child: CarouselSlider(
              items: imageUrls.map((imageUrl) {
                return Image.asset(imageUrl);
              }).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 300.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),

          // Phần nút "Tiếp tục"
          ElevatedButton(
            onPressed: _handleContinue,
            child: Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Thực hiện xử lý đăng nhập ở đây, ví dụ:
    if (username == 'admin' && password == 'password') {
      // Đăng nhập thành công, chuyển đến trang khác hoặc thực hiện các hành động cần thiết
      // Ví dụ: Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      print('Đăng nhập thành công');
    } else {
      // Đăng nhập thất bại, hiển thị thông báo lỗi hoặc thực hiện các hành động cần thiết
      print('Đăng nhập thất bại');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Tên người dùng',
                hintText: 'Nhập tên người dùng',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}