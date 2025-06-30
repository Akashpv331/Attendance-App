import 'package:flutter/material.dart';

class PopupOverlayWidget extends StatelessWidget {
  final VoidCallback onClose;

  const PopupOverlayWidget({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + 8, // just below the AppBar
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: onClose,
                    child: const Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "05 May 2025",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Spacer(),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search History',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const ListTile(title: Text("Sick Leave.....")),
              const ListTile(title: Text("23 May 2025...")),
              const ListTile(title: Text("Casual Leaves...")),
            ],
          ),
        ),
      ),
    );
  }
}
