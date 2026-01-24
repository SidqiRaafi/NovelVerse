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
        title: Text('Delete Novel'),
        content: Text('Are you sure you want to delete "${novel.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await FirestoreService().deleteNovel(novel.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Novel deleted successfully!'),
            backgroundColor: Colors.red,
          ),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(novel.title),
        elevation: 0,
        actions: [
          // Edit button
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EditNovelPage(novel: novel)),
              );
            },
          ),
          // Delete button
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteNovel(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple.shade100, Colors.white],
                ),
              ),
              child: Center(
                child: Container(
                  width: 250,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 8),
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
                              color: Colors.grey[300],
                              child: Center(
                                child: Icon(
                                  Icons.book,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.book,
                                size: 80,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    novel.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  // Author
                  Row(
                    children: [
                      Icon(Icons.person, size: 18, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'by ${novel.author}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Genre & Rating
                  Row(
                    children: [
                      // Genre chip
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.category,
                              size: 16,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(width: 4),
                            Text(
                              novel.genre,
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),

                      // Rating
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              novel.rating.toString(),
                              style: TextStyle(
                                color: Colors.amber[900],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Synopsis
                  Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    novel.synopsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
