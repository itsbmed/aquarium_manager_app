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
          // Kopfbild
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/app-header-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Screen Titel
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
          // Liste oder leerer Zustand
          Expanded(
            child: aquariums.isEmpty
                ? Center(
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
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                          ),
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
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: aquariums.length,
                    itemBuilder: (context, i) {
                      final aq = aquariums[i];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: [
                            // Name und Löschen-Button
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    aq['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => onDelete(i),
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: AppColors.muted.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.fullscreen,
                                  size: 14,
                                  color: AppColors.muted,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${aq['volume']} L',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.muted,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.crop_square,
                                  size: 14,
                                  color: AppColors.muted,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${aq['length']} × ${aq['width']} × ${aq['height']} cm',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.muted,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.input,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    aq['coralType'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
