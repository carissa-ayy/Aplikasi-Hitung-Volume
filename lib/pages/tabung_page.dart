import 'dart:math';
import 'package:flutter/material.dart';

class TabungPage extends StatefulWidget {
  const TabungPage({super.key});

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  double? _volume;

  
  final Color primaryColor = const Color(0xFF3B82F6); 
  final Color accentColor = const Color(0xFFEFF6FF);  

  void _hitungVolume() {
    setState(() {
      double? radius = double.tryParse(_radiusController.text);
      double? tinggi = double.tryParse(_tinggiController.text);
      
      if (radius != null && tinggi != null) {
        _volume = pi * pow(radius, 2) * tinggi;
      } else {
        _volume = null;
      }
    });
  }

  @override
  void dispose() {
    _radiusController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), 
      appBar: AppBar(
        title: const Text('Volume Tabung', style: TextStyle(fontWeight: FontWeight.bold)),
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
              child: Icon(Icons. view_column_rounded, size: 80, color: primaryColor.withOpacity(0.2)),
            ),
            const SizedBox(height: 24),
            
            
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jari-jari (r)',
                hintText: 'Masukkan nilai r',
                prefixIcon: Icon(Icons.straighten, color: primaryColor),
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
            const SizedBox(height: 16),
            
            
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (t)',
                hintText: 'Masukkan nilai t',
                prefixIcon: Icon(Icons.height, color: primaryColor),
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