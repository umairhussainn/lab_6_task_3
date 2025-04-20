import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDashboardApp());
}

class CustomDashboardApp extends StatelessWidget {
  const CustomDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compact Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compact Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF2F2F7),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2, // Makes the boxes smaller
          ),
          itemBuilder: (context, index) {
            final tiles = [
              {
                'icon': Icons.bar_chart,
                'label': 'Stats',
                'desc': 'Reports',
                'color': Colors.orange,
              },
              {
                'icon': Icons.notifications,
                'label': 'Alerts',
                'desc': 'New',
                'color': Colors.redAccent,
              },
              {
                'icon': Icons.people,
                'label': 'Users',
                'desc': 'Active',
                'color': Colors.purple,
              },
              {
                'icon': Icons.settings,
                'label': 'Settings',
                'desc': 'Customize',
                'color': Colors.teal,
              },
            ];
            return DashboardTile(
              iconData: tiles[index]['icon'] as IconData,
              label: tiles[index]['label'] as String,
              description: tiles[index]['desc'] as String,
              bgColor: tiles[index]['color'] as Color,
            );
          },
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String description;
  final Color bgColor;

  const DashboardTile({
    super.key,
    required this.iconData,
    required this.label,
    required this.description,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('$label tapped');
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconData, size: 26, color: bgColor),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
