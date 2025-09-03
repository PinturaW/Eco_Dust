// screens/cleanup_screen.dart
import 'package:flutter/material.dart';
import '../services/mock_services.dart';

class CleanupScreen extends StatefulWidget {
  @override
  _CleanupScreenState createState() => _CleanupScreenState();
}

class _CleanupScreenState extends State<CleanupScreen> {
  final MockCleanupService _cleanupService = MockCleanupService();
  bool _isScanning = false;
  List<Map<String, dynamic>> _foundItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Cleanup'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scan Button
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[400]!, Colors.green[600]!],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _isScanning ? null : _startScan,
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_isScanning)
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        else
                          Icon(
                            Icons.scanner,
                            size: 48,
                            color: Colors.white,
                          ),
                        SizedBox(height: 8),
                        Text(
                          _isScanning ? 'กำลังสแกน...' : 'เริ่มสแกนหาขยะดิจิทัล',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            if (_foundItems.isNotEmpty) ...[
              SizedBox(height: 24),
              Text(
                'พบขยะดิจิทัล ${_foundItems.length} รายการ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),

              // Found Items List
              ..._foundItems.map((item) => _buildCleanupItem(item)).toList(),

              SizedBox(height: 16),

              // Clean All Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _cleanAll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'ล้างทั้งหมด (${_getTotalSize()})',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],

            // Tips Section
            SizedBox(height: 24),
            _buildTipsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCleanupItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
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
              color: item['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              item['icon'],
              color: item['color'],
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${item['count']} รายการ • ${item['size']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${item['co2']}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection() {
    return Container(
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
              Icon(Icons.lightbulb_outline, color: Colors.blue[600]),
              SizedBox(width: 8),
              Text(
                'เทิปส์การทำความสะอาด',
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
            '• ลบอีเมลเก่าที่ไม่ใช้แล้วเป็นประจำ\n'
            '• จัดระเบียบรูปภาพและวิดีโอ\n'
            '• ยกเลิกการสมัครจดหมายข่าวที่ไม่อ่าน\n'
            '• ใช้ Cloud Storage อย่างมีประสิทธิภาพ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  void _startScan() async {
    setState(() {
      _isScanning = true;
      _foundItems.clear();
    });

    // Simulate scanning process
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _foundItems = _cleanupService.getCleanupItems();
      _isScanning = false;
    });
  }

  void _cleanAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ยืนยันการลบ'),
        content: Text('ต้องการลบขยะดิจิทัลทั้งหมดใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _performCleanup();
            },
            child: Text('ยืนยัน'),
          ),
        ],
      ),
    );
  }

  void _performCleanup() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('กำลังลบขยะดิจิทัล...'),
          ],
        ),
      ),
    );

    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context); // Close loading dialog

    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('สำเร็จ! 🎉'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ลบขยะดิจิทัลสำเร็จแล้ว'),
            SizedBox(height: 8),
            Text('ลดคาร์บอนได้ ${_getTotalCO2()}'),
            Text('ได้รับ ${_getTotalPoints()} แต้ม'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _foundItems.clear();
              });
            },
            child: Text('เยี่ยม!'),
          ),
        ],
      ),
    );
  }

  String _getTotalSize() {
    double totalMB = _foundItems.fold(0.0, (sum, item) {
      String size = item['size'];
      double value = double.parse(size.split(' ')[0]);
      return sum + value;
    });
    return '${totalMB.toStringAsFixed(1)} MB';
  }

  String _getTotalCO2() {
    double totalCO2 = _foundItems.fold(0.0, (sum, item) {
      String co2 = item['co2'];
      double value = double.parse(co2.split(' ')[0]);
      return sum + value;
    });
    return '${totalCO2.toStringAsFixed(1)} kg CO₂';
  }

  int _getTotalPoints() {
    return _foundItems.fold(0, (sum, item) => sum + (item['points'] as int));
  }
}