import 'package:flutter/material.dart';
import '../../models/novel.dart';
import '../../services/firestore_service.dart';

class AddNovelPage extends StatefulWidget {
  @override
  _AddNovelPageState createState() => _AddNovelPageState();
}

class _AddNovelPageState extends State<AddNovelPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();
  final TextEditingController _coverUrlController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _genreController.dispose();
    _synopsisController.dispose();
    _coverUrlController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  Future<void> _saveNovel() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      Novel novel = Novel(
        id: '',
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        genre: _genreController.text.trim(),
        synopsis: _synopsisController.text.trim(),
        coverUrl: _coverUrlController.text.trim(),
        rating: double.parse(_ratingController.text.trim()),
      );

      await _firestoreService.addNovel(novel);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Novel added successfully!'),
          backgroundColor: Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: const Color(0xFFC62828),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF2D2D2D),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Novel',
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFB8941F),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    _buildTextField(
                      controller: _titleController,
                      label: 'Title',
                      hint: 'Enter novel title',
                      icon: Icons.book_rounded,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Author
                    _buildTextField(
                      controller: _authorController,
                      label: 'Author',
                      hint: 'Enter author name',
                      icon: Icons.person_rounded,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Author is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Genre
                    _buildTextField(
                      controller: _genreController,
                      label: 'Genre',
                      hint: 'e.g. Fantasy, Mystery, Romance',
                      icon: Icons.category_rounded,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Genre is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Synopsis
                    _buildTextField(
                      controller: _synopsisController,
                      label: 'Synopsis',
                      hint: 'Enter novel synopsis',
                      icon: Icons.description_rounded,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Synopsis is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Cover URL
                    _buildTextField(
                      controller: _coverUrlController,
                      label: 'Cover Image URL',
                      hint: 'https://example.com/cover.jpg',
                      icon: Icons.image_rounded,
                      keyboardType: TextInputType.url,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Cover URL is required';
                        }
                        if (!value.startsWith('http')) {
                          return 'Enter a valid URL';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Rating
                    _buildTextField(
                      controller: _ratingController,
                      label: 'Rating',
                      hint: '0.0 - 5.0',
                      icon: Icons.star_rounded,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Rating is required';
                        }
                        double? rating = double.tryParse(value);
                        if (rating == null || rating < 0 || rating > 5) {
                          return 'Rating must be between 0.0 and 5.0';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _saveNovel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB8941F), // Gold
                          foregroundColor: const Color(0xFF1E1E1E), // Black
                          disabledBackgroundColor: const Color(0xFFB8941F).withOpacity(0.5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.save_rounded, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Save Novel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D2D2D),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFF2D2D2D).withOpacity(0.4),
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFFB8941F), // Gold
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFD4C5B0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFD4C5B0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFB8941F), // Gold
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFC62828), // Red
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFC62828),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
