import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../models/user.dart' hide globalCoverImage;
import '../../main.dart' hide globalProfileImage;

class ProfilePage extends StatefulWidget {
  final UserModel? user;
  const ProfilePage({super.key, this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  File? _coverFile;
  final ImagePicker _picker = ImagePicker();

  // 1. Tambahkan Controller untuk mengedit teks
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _imageFile = globalProfileImage;
    _coverFile = globalCoverImage;

    // 2. Inisialisasi controller dengan data yang ada
    final user = widget.user ?? loggedInUser;
    _nameController = TextEditingController(text: user?.name ?? 'Guest User');
    _phoneController = TextEditingController(
      text: user?.phone ?? '+62 000 0000 000',
    );
    _locationController = TextEditingController(
      text: user?.location ?? 'Not Set',
    );
  }

  @override
  void dispose() {
    // 3. Bersihkan controller saat halaman ditutup
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source, bool isCover) async {
    final XFile? selected = await _picker.pickImage(source: source);
    if (selected != null) {
      setState(() {
        if (isCover) {
          _coverFile = File(selected.path);
          globalCoverImage = _coverFile;
        } else {
          _imageFile = File(selected.path);
          globalProfileImage = _imageFile;
        }
      });
    }
  }

  void _showPickerOptions(bool isCover) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeri'),
              onTap: () {
                _pickImage(ImageSource.gallery, isCover);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Kamera'),
              onTap: () {
                _pickImage(ImageSource.camera, isCover);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = widget.user ?? loggedInUser;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER: SAMPUL & FOTO ---
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () => _showPickerOptions(true),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C3AED),
                      image: _coverFile != null
                          ? DecorationImage(
                              image: FileImage(_coverFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: _coverFile == null
                        ? const Center(
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                            ),
                          )
                        : null,
                  ),
                ),
                Positioned(
                  top: 150,
                  child: GestureDetector(
                    onTap: () => _showPickerOptions(false),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : null,
                        child: _imageFile == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // --- INPUT FIELDS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildEditField(Icons.person, "Full Name", _nameController),
                  const SizedBox(height: 15),
                  _buildEditField(
                    Icons.phone,
                    "Phone Number",
                    _phoneController,
                  ),
                  const SizedBox(height: 15),
                  _buildEditField(
                    Icons.location_on,
                    "Location",
                    _locationController,
                  ),
                  const SizedBox(height: 15),

                  // Email biasanya tidak diedit secara bebas, jadi kita tampilkan saja
                  _buildProfileItem(
                    Icons.email,
                    "Email (Non-editable)",
                    userData?.email ?? '-',
                  ),

                  const SizedBox(height: 40),

                  // --- BUTTON SIMPAN ---
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // 4. Update data ke variabel global
                        setState(() {
                          loggedInUser = UserModel(
                            name: _nameController.text,
                            email: userData?.email ?? '',
                            role: userData?.role ?? 'Member',
                            phone: _phoneController.text,
                            location: _locationController.text,
                          );
                          globalProfileImage = _imageFile;
                          globalCoverImage = _coverFile;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Changes saved successfully!'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Input Field
  Widget _buildEditField(
    IconData icon,
    String label,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF7C3AED)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF7C3AED), width: 2),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
