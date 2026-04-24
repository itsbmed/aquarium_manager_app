import 'package:flutter/material.dart';
import '../app_colors.dart';

// Listenansicht aller erstellten Aquarien
class AquariumList extends StatelessWidget {
  final List<Map<String, dynamic>> aquariums;
  final void Function(int) onDelete;
  final VoidCallback onCreateTap;

  const AquariumList({
    super.key,
    required this.aquariums,
    required this.onDelete,
    required this.onCreateTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          // Kopfbereich
          Container(
            height: 180,
            width: double.infinity,
            color: AppColors.primary,
            child: const Center(
              child: Text(
                'ATI',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'AQUARIUM MANAGER',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: 2,
              ),
            ),
          ),

          // Leerer Zustand
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.water,
                    size: 48,
                    color: AppColors.muted.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Noch keine Aquarien vorhanden',
                    style: TextStyle(color: AppColors.muted, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: onCreateTap,
                    child: const Text(
                      'Erstelle dein erstes Aquarium',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
