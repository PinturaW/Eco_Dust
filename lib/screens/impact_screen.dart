// screens/impact_screen.dart
import 'package:flutter/material.dart';

class ImpactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลกระทบสิ่งแวดล้อม'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Impact Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[400]!, Colors.green[600]!],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.eco,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '47.3 kg',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CO₂ ที่ลดได้ทั้งหมด',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'เท่ากับการปลูกต้นไม้ 2.1 ต้น',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Weekly Progress
            Text(
              'ความก้าวหน้าประจำสัปดาห์',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('เป้าหมาย: 10 kg CO₂'),
                      Text('8.5 / 10 kg'),
                    ],
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.85,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Impact Categories
            Text(
              'แบ่งตามประเภท',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 16),

            _buildImpactCategory(
              'อีเมล',
              '18.7 kg CO₂',
              '2,450 อีเมล',
              Icons.email,
              Colors.red,
              0.4,
            ),

            SizedBox(height: 12),

            _buildImpactCategory(
              'รูปภาพ',
              '15.2 kg CO₂',
              '1,200 รูป',
              Icons.photo_library,
              Colors.purple,
              0.32,
            ),

            SizedBox(height: 12),

            _buildImpactCategory(
              'วิดีโอ',
              '9.8 kg CO₂',
              '45 วิดีโอ',
              Icons.videocam,
              Colors.blue,
              0.21,
            ),

            SizedBox(height: 12),

            _buildImpactCategory(
              'แคช & ไฟล์ชั่วคราว',
              '3.6 kg CO₂',
              '850 ไฟล์',
              Icons.cached,
              Colors.orange,
              0.07,
            ),

            SizedBox(height: 24),

            // Environmental Facts
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue[600]),
                      SizedBox(width: 8),
                      Text(
                        'คุณรู้หรือไม่?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• อีเมล 1 ฉบับ = 4 กรัม CO₂\n'
                    '• สตรีมวิดีโอ 1 ชั่วโมง = 36 กรัม CO₂\n'
                    '• ค้นหาใน Google 1 ครั้ง = 0.2 กรัม CO₂\n'
                    '• เก็บไฟล์ 1 GB ใน Cloud = 0.5 กรัม CO₂/วัน',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Share Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _shareImpact,
                icon: Icon(Icons.share),
                label: Text('แชร์ผลกระทบของฉัน'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactCategory(
    String title,
    String impact,
    String count,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      impact,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _shareImpact() {
    // Implement sharing functionality
    print('Sharing impact...');
  }
}