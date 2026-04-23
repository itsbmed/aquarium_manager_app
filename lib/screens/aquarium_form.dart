import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';

// Formular zum Erstellen eines neuen Aquariums
class AquariumForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;
  const AquariumForm({super.key, required this.onSave});

  @override
  State<AquariumForm> createState() => _AquariumFormState();
}

class _AquariumFormState extends State<AquariumForm> {
  final _key = GlobalKey<FormState>();
  final name = TextEditingController();
  final length = TextEditingController();
  final width = TextEditingController();
  final height = TextEditingController();
  double volume = 0;
  String? coral;

  // Volumen berechnen: (L × B × H) / 1000 = Liter
  void calcVolume() {
    final l = double.tryParse(length.text) ?? 0;
    final w = double.tryParse(width.text) ?? 0;
    final h = double.tryParse(height.text) ?? 0;
    setState(() => volume = (l * w * h) / 1000);
  }

  // Speichern – Validierung prüfen und Daten an HomeScreen senden
  void save() {
    if (!_key.currentState!.validate()) return;
    if (coral == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte wähle einen Korallentyp')),
      );
      return;
    }

    // Daten an HomeScreen übergeben
    widget.onSave({
      'name': name.text.trim(),
      'length': length.text,
      'width': width.text,
      'height': height.text,
      'volume': volume.toStringAsFixed(1),
      'coralType': coral,
    });

    // Formular zurücksetzen
    name.clear();
    length.clear();
    width.clear();
    height.clear();
    setState(() {
      volume = 0;
      coral = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                'NEW AQUARIUM',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    _card(
                      'Aquarium Name',
                      null,
                      TextFormField(
                        controller: name,
                        style: const TextStyle(color: AppColors.text),
                        decoration: _input('e.g. Liebaqua'),
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Bitte einen Namen eingeben'
                            : null,
                      ),
                    ),

                    _card(
                      'Dimensions (cm)',
                      Icons.crop_square,
                      Row(
                        children: [
                          Expanded(child: _dim(length, 'Length')),
                          const SizedBox(width: 8),
                          Expanded(child: _dim(width, 'Width')),
                          const SizedBox(width: 8),
                          Expanded(child: _dim(height, 'Height')),
                        ],
                      ),
                    ),

                    _card(
                      'Volume',
                      Icons.fullscreen,
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.input,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          volume > 0
                              ? '${volume.toStringAsFixed(1)} L'
                              : 'Enter dimensions to calculate...',
                          style: TextStyle(
                            fontSize: volume > 0 ? 18 : 14,
                            fontWeight: volume > 0
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: volume > 0
                                ? AppColors.text
                                : AppColors.muted,
                          ),
                        ),
                      ),
                    ),

                    _card(
                      'Coral Type',
                      Icons.grid_view,
                      Row(
                        children: ['SPS', 'LPS', 'Mixed'].map((t) {
                          final on = coral == t;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: t != 'Mixed' ? 8 : 0,
                              ),
                              child: GestureDetector(
                                onTap: () => setState(() => coral = t),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: on
                                        ? AppColors.primary
                                        : AppColors.input,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      t,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: on
                                            ? Colors.white
                                            : AppColors.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Speichern-Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String label, IconData? icon, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: AppColors.muted),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  InputDecoration _input(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.muted, fontSize: 14),
      filled: true,
      fillColor: AppColors.input,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorStyle: const TextStyle(fontSize: 11),
    );
  }

  Widget _dim(TextEditingController ctrl, String label) {
    return TextFormField(
      controller: ctrl,
      style: const TextStyle(color: AppColors.text),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      onChanged: (_) => calcVolume(),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Pflichtfeld';
        final n = double.tryParse(v);
        if (n == null || n <= 0) return 'Ungültig';
        return null;
      },
      decoration: _input(label),
    );
  }
}
