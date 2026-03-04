import 'dart:math';
import 'package:flutter/material.dart';

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _sisiController = TextEditingController();
  double? _volume;

  
  final Color primaryColor = const Color(0xFF10B981); 
  final Color accentColor = const Color(0xFFECFDF5);  

  void _hitungVolume() {
    setState(() {
      double? sisi = double.tryParse(_sisiController.text);
      if (sisi != null) {
        
        _volume = pow(sisi, 3).toDouble();
      } else {
        _volume = null;
      }
    });
  }

  @override
  void dispose() {
    _sisiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Volume Kubus', style: TextStyle(fontWeight: FontWeight.bold)),
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
                Icons.view_in_ar_rounded, // Ikon kotak 3D yang cocok untuk kubus
                size: 80, 
                color: primaryColor.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 24),

            
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang Sisi (s)',
                hintText: 'Masukkan nilai sisi',
                prefixIcon: Icon(Icons.square_foot, color: primaryColor),
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