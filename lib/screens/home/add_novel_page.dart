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
        SnackBar(
          content: Text('Novel added successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Novel'),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter novel title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.book),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Author
                    TextFormField(
                      controller: _authorController,
                      decoration: InputDecoration(
                        labelText: 'Author',
                        hintText: 'Enter author name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Author is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Genre
                    TextFormField(
                      controller: _genreController,
                      decoration: InputDecoration(
                        labelText: 'Genre',
                        hintText: 'e.g. Fantasy, Mystery, Romance',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.category),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Genre is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Synopsis
                    TextFormField(
                      controller: _synopsisController,
                      decoration: InputDecoration(
                        labelText: 'Synopsis',
                        hintText: 'Enter novel synopsis',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Synopsis is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Cover URL
                    TextFormField(
                      controller: _coverUrlController,
                      decoration: InputDecoration(
                        labelText: 'Cover Image URL',
                        hintText: 'https://example.com/cover.jpg',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.image),
                      ),
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
                    SizedBox(height: 16),

                    // Rating
                    TextFormField(
                      controller: _ratingController,
                      decoration: InputDecoration(
                        labelText: 'Rating',
                        hintText: '0.0 - 5.0',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.star),
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                    SizedBox(height: 32),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: _saveNovel,
                        icon: Icon(Icons.save),
                        label: Text(
                          'Save Novel',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
