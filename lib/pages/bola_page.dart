import 'dart:math';
import 'package:flutter/material.dart';

class BolaPage extends StatefulWidget {
  const BolaPage({super.key});

  @override
  State<BolaPage> createState() => _BolaPageState();
}

class _BolaPageState extends State<BolaPage> {
  final TextEditingController _radiusController = TextEditingController();
  double? _volume;

  
  final Color primaryColor = const Color(0xFFFB7185); 
  final Color accentColor = const Color(0xFFFFF1F2);  

  void _hitungVolume() {
    setState(() {
      double? radius = double.tryParse(_radiusController.text);
      if (radius != null) {
        
        _volume = (4 / 3) * pi * pow(radius, 3);
      } else {
        _volume = null;
      }
    });
  }

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Volume Bola', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Icon(
                Icons.blur_circular_rounded, 
                size: 80, 
                color: primaryColor.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 24),

            
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jari-jari (r)',
                hintText: 'Masukkan nilai jari-jari',
                prefixIcon: Icon(Icons.radio_button_checked, color: primaryColor),
                suffixText: 'cm',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            
            ElevatedButton(
              onPressed: _hitungVolume,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 2,
              ),
              child: const Text(
                'Hitung Volume Sekarang',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 32),

            
            if (_volume != null)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: primaryColor.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Text(
                      'HASIL PERHITUNGAN',
                      style: TextStyle(
                        fontSize: 12, 
                        fontWeight: FontWeight.w800, 
                        letterSpacing: 1.2,
                        color: primaryColor
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_volume!.toStringAsFixed(2)} cm³',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}