import 'package:flutter/material.dart';
import '../../models/novel.dart';
import '../../services/firestore_service.dart';
import 'detail_page.dart';
import 'add_novel_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Novel>? _cachedNovels;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E8),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'NovelVerse',
          style: TextStyle(
            color: Color(0xFFB8941F),
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Color(0xFF2D2D2D)),
              decoration: InputDecoration(
                hintText: 'Search novels...',
                hintStyle: TextStyle(
                  color: const Color(0xFF2D2D2D).withOpacity(0.4),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFFB8941F),
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Color(0xFF6B5B4B),
                        ),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
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
                    color: Color(0xFFB8941F),
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
            ),
          ),
          
          // Novels list
          Expanded(
            child: StreamBuilder<List<Novel>>(
              stream: _firestoreService.searchNovels(_searchQuery),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _cachedNovels = snapshot.data;
                }
                
                if (snapshot.connectionState == ConnectionState.waiting && _cachedNovels == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFB8941F),
                    ),
                  );
                }
                
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Color(0xFFC62828)),
                    ),
                  );
                }
                
                List<Novel> novels = _cachedNovels ?? [];
                
                if (novels.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          size: 64,
                          color: const Color(0xFF6B5B4B).withOpacity(0.4),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty ? 'No novels yet' : 'No novels found',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF6B5B4B).withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _searchQuery.isEmpty
                              ? 'Tap + to add your first novel'
                              : 'Try a different search term',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF6B5B4B).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                return ListView.builder(
                  itemCount: novels.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    Novel novel = novels[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFD4C5B0),
                          width: 0.5,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(novel: novel),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cover image
                              Hero(
                                tag: 'novel_${novel.id}',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    novel.coverUrl.isNotEmpty
                                        ? novel.coverUrl
                                        : 'https://via.placeholder.com/80x120?text=No+Cover',
                                    width: 60,
                                    height: 90,
                                    fit: BoxFit.cover,
                                    errorBuilder: (ctx, err, stack) => Container(
                                      width: 60,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F1E8),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.book,
                                        size: 30,
                                        color: Color(0xFFB8941F),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              
                              // Novel info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      novel.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'by ${novel.author}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF6B5B4B),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF5F1E8),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            novel.genre,
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF8B4513),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.star_rounded,
                                          size: 16,
                                          color: Color(0xFFB8941F),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          novel.rating.toString(),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2D2D2D),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Arrow icon
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Color(0xFF6B5B4B),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNovelPage()),
          );
        },
        backgroundColor: const Color(0xFFB8941F),
        foregroundColor: const Color(0xFF1E1E1E),
        elevation: 4,
        child: const Icon(Icons.add_rounded),
        tooltip: 'Add Novel',
      ),
    );
  }
}
