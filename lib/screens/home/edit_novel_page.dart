import 'package:flutter/material.dart';
import '../../models/novel.dart';
import '../../services/firestore_service.dart';

class EditNovelPage extends StatefulWidget {
  final Novel novel;

  const EditNovelPage({required this.novel});

  @override
  _EditNovelPageState createState() => _EditNovelPageState();
}

class _EditNovelPageState extends State<EditNovelPage> {
  final _formKey = GlobalKey<FormState>();
  final FirestoreService _firestoreService = FirestoreService();

  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _genreController;
  late TextEditingController _synopsisController;
  late TextEditingController _coverUrlController;
  late TextEditingController _ratingController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.novel.title);
    _authorController = TextEditingController(text: widget.novel.author);
    _genreController = TextEditingController(text: widget.novel.genre);
    _synopsisController = TextEditingController(text: widget.novel.synopsis);
    _coverUrlController = TextEditingController(text: widget.novel.coverUrl);
    _ratingController = TextEditingController(text: widget.novel.rating.toString());
  }

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

  Future<void> _updateNovel() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      Novel updatedNovel = Novel(
        id: widget.novel.id,
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        genre: _genreController.text.trim(),
        synopsis: _synopsisController.text.trim(),
        coverUrl: _coverUrlController.text.trim(),
        rating: double.parse(_ratingController.text.trim()),
      );

      await _firestoreService.updateNovel(updatedNovel);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Novel updated successfully!'),
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
          'Edit Novel',
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

                    // Update Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _updateNovel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB8941F),
                          foregroundColor: const Color(0xFF1E1E1E),
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
                              'Update Novel',
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
              color: const Color(0xFFB8941F),
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD4C5B0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFD4C5B0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFB8941F), width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFC62828), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFC62828), width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
