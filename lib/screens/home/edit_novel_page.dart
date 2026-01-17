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
    // Pre-fill dengan data existing
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
        SnackBar(
          content: Text('Novel updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context); // Kembali ke Detail Page
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
        title: Text('Edit Novel'),
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

                    // Update Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: _updateNovel,
                        icon: Icon(Icons.save),
                        label: Text(
                          'Update Novel',
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
