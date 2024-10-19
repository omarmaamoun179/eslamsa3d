import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Top logo and app name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left-aligned text
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "and start creativity ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Right-aligned logo
                  Image.asset(
                    'assets/images/logo.png', // Path to the uploaded logo file
                    height: 100,
                    color: Colors.white,
                  ),
                ],
              ),
              const Spacer(),
              // Best fashion 3D Design App text centered
              const Text(
                "Best fashion 3D Design App💥",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Centered content (fields)
              IntlPhoneField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  // Set the background to black
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.white),
                  // Set label text color to white
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                // Set default to Egypt
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                style: TextStyle(color: Colors.white),
                // Set the input text color to white
                cursorColor: Colors.white, // Set the cursor color to white
              ),

              const SizedBox(height: 20),
              Neumorphic(
                style: const NeumorphicStyle(
                  depth: -5,
                  intensity: 0.8,
                  shape: NeumorphicShape.concave,
                ),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color:
                            Colors.white, // Changed to white to match the theme
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color is white
                  cursorColor: Colors.white, // Cursor color is white
                ),
              ),

              // TextButton for forgot password (right-aligned and white color)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to the ForgetPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen()),
                    );
                  },
                  child: const Text(
                    "Did you forget your password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              // Login Button
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                // Adjusted the padding
                child: NeumorphicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 0,
                    intensity: 0.8,
                    color: const Color(0x00000025),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              // Text below Login Button for sign-up
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: const Text(
                  "Let's create a special account 👑",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ForgetPasswordScreen

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: NeumorphicTheme.baseColor(context),
          // Same color as body
          elevation: 0,
          // Remove shadow
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            // iPhone-style back icon
            onPressed: () {
              Navigator.pop(context); // Back to the previous screen
            },
          ),
          title: const Text(
            'Forget Password',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text above phone number field with 100 padding
              const Padding(
                padding: EdgeInsets.only(bottom: 100.0, top: 300.0),
                child: Column(
                  children: [
                    Text(
                      "Just add your number",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "We will send OTP 📲",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              // Phone Number Field
              Neumorphic(
                style: const NeumorphicStyle(
                  depth: -5,
                  intensity: 0.8,
                  shape: NeumorphicShape.concave,
                ),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'EG', // Set default to Egypt
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              const Spacer(),
              // Send OTP Button with bottom padding of 50
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: NeumorphicButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen()),
                    );
                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 8,
                    intensity: 0.8,
                    color: const Color(0x00000025), // Dark button color
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Send OTP',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: NeumorphicTheme.baseColor(context),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Verify OTP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the OTP sent to your number",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),
              // OTP Text Field
              OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFFFFFFFF),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle validation if necessary
                },
                onSubmit: (String verificationCode) {
                  // When the code is submitted
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }, // end onSubmit
              ),
              const SizedBox(height: 50),
              // Verify Button
              NeumorphicButton(
                onPressed: () {
                  // Handle OTP verification
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  intensity: 0.8,
                  color: const Color(0x00000025),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Top logo and app name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left-aligned text
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Join the community ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Right-aligned logo
                  Image.asset(
                    'assets/images/logo.png', // Path to the uploaded logo file
                    height: 100,
                    color: Colors.white,
                  ),
                ],
              ),
              const Spacer(),
              // Name Field
              const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number Field
              IntlPhoneField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  // Set the background to black
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.white),
                  // Set label text color to white
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                // Set default to Egypt
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                style: TextStyle(color: Colors.white),
                // Set the input text color to white
                cursorColor: Colors.white, // Set the cursor color to white
              ),
              const SizedBox(height: 20),
              // Password Field
              Neumorphic(
                style: const NeumorphicStyle(
                  depth: -5,
                  intensity: 0.8,
                  shape: NeumorphicShape.concave,
                ),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color:
                            Colors.white, // Changed to white to match the theme
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color is white
                  cursorColor: Colors.white, // Cursor color is white
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Password Field
              Neumorphic(
                style: const NeumorphicStyle(
                  depth: -5,
                  intensity: 0.8,
                  shape: NeumorphicShape.concave,
                ),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    labelText: 'confirmation Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color:
                            Colors.white, // Changed to white to match the theme
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Text color is white
                  cursorColor: Colors.white, // Cursor color is white
                ),
              ),
              const Spacer(),
              // Sign Up Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                // Adjusted the padding
                child: NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 0,
                    intensity: 0.8,
                    color: const Color(0x00000025),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      subtitle: 'This is product 1',
      image: 'assets/images/download.jpeg',
      file3D: 'assets/images/ll.obj',
      Price: 5,
    ),
    Product(
      title: 'Product 2',
      subtitle: 'This is product 2',
      image: 'assets/images/download.jpeg',
      file3D: 'assets/images/lll.obj',
      Price: 5,
    ),
    Product(
      title: 'Product 3',
      subtitle: 'This is product 3',
      image: 'assets/images/download.jpeg',
      file3D: 'assets/3d/product3_3d.obj',
      Price: 5,
    ),
    Product(
      title: 'Product 4',
      subtitle: 'This is product 4',
      image: 'assets/images/download.jpeg',
      file3D: 'assets/3d/product4_3d.obj',
      Price: 5,
    ),
  ];

  final List<String> sliderImages = [
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
    'assets/images/download.jpeg',
  ];

  final Gallery3DController _galleryController = Gallery3DController(itemCount: 5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Eslam Saa'd Store",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Centered 3D Slider
              Container(
                height: 250,
                alignment: Alignment.center,
                child: Gallery3D(
                  controller: _galleryController,
                  itemConfig: const GalleryItemConfig(
                    width: 150,
                    height: 250,
                    radius: 10,
                  ),
                  isClip: true,
                  onItemChanged: (index) {
                    print('Current slider item: $index');
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(sliderImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),

              const SizedBox(height: 20),

              // MasonryGridView for product cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                      products: products,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;
  final List<Product> products;
  final int index;

  ProductCard({
    required this.product,
    required this.products,
    required this.index,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              products: widget.products,
              initialIndex: widget.index,
            ),
          ),
        );
      },
      child: Container(

        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${widget.product.Price}k EG",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      widget.product.subtitle,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductDetailsScreen extends StatefulWidget {
  final List<Product> products;
  final int initialIndex;

  ProductDetailsScreen({required this.products, required this.initialIndex});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late PageController _pageController;
  late PageController _imageListController;
  int _currentIndex = 0;
  int _currentImageIndex = 0;
  Timer? _timer;
  String selectedSize = 'M';
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _imageListController = PageController(viewportFraction: 0.3);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _imageListController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentImageIndex < 4) {
        _currentImageIndex++;
      } else {
        _currentImageIndex = 0;
      }
      _imageListController.animateToPage(
        _currentImageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.products[_currentIndex].title,
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.products.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _currentImageIndex = 0;
            _imageListController.jumpToPage(0);
          });
        },
        itemBuilder: (context, index) {
          return _buildProductDetails(widget.products[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModelViewerScreen(product: widget.products[_currentIndex]),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.threed_rotation, color: Colors.black),
        tooltip: 'View 3D Model',
      ),
    );
  }

  Widget _buildProductDetails(Product product) {
    List<String> imagePaths = [
      product.image,
      "assets/images/1.webp",
      "assets/images/2.webp",
      "assets/images/3.webp",
      "assets/images/4.webp",
    ];

    List<String> sizes = ['M', 'L', '2XL', 'XS', 'XL', 'S', '3XL'];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Image
          GestureDetector(
            onTap: () => _openImageViewer(imagePaths[_currentImageIndex]),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset(
                imagePaths[_currentImageIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal Image List
          SizedBox(
            height: 100,
            child: PageView.builder(
              controller: _imageListController,
              itemCount: imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    child: Image.asset(
                      imagePaths[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  product.subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${product.Price}",
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Color",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Black",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Size",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: sizes.map((size) {
                    return ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      backgroundColor: Colors.grey[800],
                      selectedColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selectedSize == size ? Colors.black : Colors.white,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          print('Added to cart: ${product.title}, Size: $selectedSize, Quantity: $quantity');
                        },
                        child: Text('ADD TO CART'),
                      ),
                    ),
                    SizedBox(width: 16), // Space for floating action button
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openImageViewer(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewerScreen(imagePath: imagePath),
      ),
    );
  }
}


class ImageViewerScreen extends StatelessWidget {
  final String imagePath;

  ImageViewerScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Image Viewer"),
      ),
      body: Container(
        height: 1000,
        width: 1000,
        child: InteractiveViewer(
          panEnabled: true, // Allows panning
          minScale: 0.5,    // Minimum zoom scale
          maxScale: 4.0,    // Maximum zoom scale
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
class ModelViewerScreen extends StatelessWidget {
  final Product product;

  ModelViewerScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: NeumorphicTheme.baseColor(context),
          // Same color as body
          elevation: 0,
          // Remove shadow
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            // iPhone-style back icon
            onPressed: () {
              Navigator.pop(context); // Back to the previous screen
            },
          ),
          title: const Text(
            '3D Model Viewer',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/eslam.jpg',
                // Replace with your background image path
                fit: BoxFit.fitHeight, // Adjust image to fill the space
              ),
            ),
            // 3D Model Viewer on top with adjusted size
            const Center(
              child: ModelViewer(
                backgroundColor: Colors.transparent,
                src: 'assets/images/sherif3.glb',
                // Your 3D model path
                autoRotate: true,
                // Enable auto-rotation if desired
                disableZoom: false,
                // Enable zoom
                ar: true, // Enable AR if supported
              ),
            ),
            // Bottom-left logo
            Positioned(
              bottom: 10, // Adjust distance from the bottom
              left: 10, // Adjust distance from the left
              child: Image.asset(
                'assets/images/logo.png', // Path to the logo image
                width: 100, // Adjust logo size
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper class for the product details
class Product {
  final String title;
  final String subtitle;
  final String image;
  final String file3D;

  final int Price;

  Product({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.file3D,
    required this.Price,
  });
}
