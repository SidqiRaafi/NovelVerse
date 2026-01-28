import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150,
            pinned: true,
            floating: false,
            elevation: 0,
            backgroundColor: const Color(0xFFD4AF37),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFFD4AF37),
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'About',
                style: TextStyle(
                  color: Color(0xFF2D2D2D),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFD4AF37), Color(0xFFD4AF37)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(top: 20),
                    child: const Icon(
                      Icons.info_outline_rounded,
                      size: 70,
                      color: Color(0xFFF5F1E8),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 80),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 10),

                // About Card
                _buildContentCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB8941F).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.book_rounded,
                              color: Color(0xFFB8941F),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'About NovelVerse',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'NovelVerse is your personal book tracking companion. Keep track of novels you want to read, are reading, or have finished. Organize your reading list and never forget a great book recommendation again!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B5B4B),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Vision Card
                _buildContentCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB8941F).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline_rounded,
                              color: Color(0xFFB8941F),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Our Vision',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'To help readers organize their personal book collections and keep track of their reading journey. A simple, beautiful tool for book lovers to manage their reading lists.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B5B4B),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Features',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                const SizedBox(height: 12),

                // Features Grid
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.search_rounded,
                            title: 'Smart Search',
                            subtitle: 'Find your books',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.add_circle_outline_rounded,
                            title: 'Add Novel',
                            subtitle: 'Track new books',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.edit_rounded,
                            title: 'Edit Novel',
                            subtitle: 'Update details',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFeatureCard(
                            icon: Icons.delete_outline_rounded,
                            title: 'Delete Novel',
                            subtitle: 'Remove books',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                const SizedBox(height: 12),

                Column(
                  children: [
                    _buildTeamMemberCard(
                      name: 'Sidqi Raafi',
                      nim: '23552011395',
                      role: 'Lead Developer & Maintainer',
                      icon: Icons.code_rounded,
                    ),
                    const SizedBox(height: 12),
                    _buildTeamMemberCard(
                      name: 'Rayhan Khadafi',
                      nim: '23552011302',
                      role: 'Authentication & Logo Designer',
                      icon: Icons.design_services_rounded,
                    ),
                    const SizedBox(height: 12),
                    _buildTeamMemberCard(
                      name: 'Faisal',
                      nim: '23552012015',
                      role: 'Profile Firebase Integration',
                      icon: Icons.cloud_rounded,
                    ),
                    const SizedBox(height: 12),
                    _buildTeamMemberCard(
                      name: 'Rifki Febrian',
                      nim: '23552011430',
                      role: 'Splash Screen & About Implementation',
                      icon: Icons.mobile_friendly_rounded,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                _buildContentCard(
                  child: Column(
                    children: [
                      _buildInfoRow(
                        icon: Icons.info_outline_rounded,
                        label: 'Version',
                        value: '1.0.0',
                      ),
                      const Divider(height: 20),
                      _buildInfoRow(
                        icon: Icons.update_rounded,
                        label: 'Last Updated',
                        value: 'January 2026',
                      ),
                      const Divider(height: 20),
                      _buildInfoRow(
                        icon: Icons.copyright_rounded,
                        label: 'Copyright',
                        value: '© 2026 NovelVerse',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Footer
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Made with ❤️ for book lovers',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B5B4B),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Version 1.0.0 • Built with Flutter',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6B5B4B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '© 2026 NovelVerse Team',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF6B5B4B),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildContentCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFB8941F).withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8941F).withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    const color = Color(0xFFB8941F);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D2D2D),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Color(0xFF6B5B4B)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String nim,
    required String role,
    required IconData icon,
  }) {
    const color = Color(0xFFB8941F);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  nim,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B5B4B),
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B5B4B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF6B5B4B)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF6B5B4B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF2D2D2D),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
