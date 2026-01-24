import 'package:flutter/material.dart';
import '../../models/novel.dart';
import '../../services/firestore_service.dart';
import 'edit_novel_page.dart';

class DetailPage extends StatelessWidget {
  final Novel novel;

  const DetailPage({required this.novel});

  Future<void> _deleteNovel(BuildContext context) async {
    // Confirmation dialog
    bool? confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Delete Novel',
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${novel.title}"?',
          style: const TextStyle(color: Color(0xFF6B5B4B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF6B5B4B)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFFC62828)),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await FirestoreService().deleteNovel(novel.id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Novel deleted successfully!'),
            backgroundColor: Color(0xFFC62828),
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
      }
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
        title: Text(
          novel.title,
          style: const TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          // Edit button
          IconButton(
            icon: const Icon(
              Icons.edit_rounded,
              color: Color(0xFFB8941F),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EditNovelPage(novel: novel)),
              );
            },
          ),
          // Delete button
          IconButton(
            icon: const Icon(
              Icons.delete_rounded,
              color: Color(0xFFC62828),
            ),
            onPressed: () => _deleteNovel(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F1E8),
              ),
              child: Center(
                child: Hero(
                  tag: 'novel_${novel.id}',
                  child: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: novel.coverUrl.isNotEmpty
                          ? Image.network(
                              novel.coverUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, stack) => Container(
                                color: Colors.white,
                                child: const Center(
                                  child: Icon(
                                    Icons.book,
                                    size: 80,
                                    color: Color(0xFFB8941F),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: Colors.white,
                              child: const Center(
                                child: Icon(
                                  Icons.book,
                                  size: 80,
                                  color: Color(0xFFB8941F),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    novel.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D2D2D),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Author
                  Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        size: 18,
                        color: Color(0xFF6B5B4B),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'by ${novel.author}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B5B4B),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Genre & Rating
                  Row(
                    children: [
                      // Genre chip
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B4513).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF8B4513).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.category_rounded,
                              size: 16,
                              color: Color(0xFF8B4513),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              novel.genre,
                              style: const TextStyle(
                                color: Color(0xFF8B4513),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Rating chip
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8941F).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFB8941F).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: Color(0xFFB8941F),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              novel.rating.toString(),
                              style: const TextStyle(
                                color: Color(0xFFB8941F),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Synopsis
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFD4C5B0),
                        width: 0.5,
                      ),
                    ),
                    child: Text(
                      novel.synopsis,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Color(0xFF2D2D2D),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
