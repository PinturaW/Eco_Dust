// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <- เพื่อเปลี่ยนสี status bar
import '../widgets/cleanup_card.dart';
import '../models/cleanup_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top; // ความสูง notch/status bar

    return Scaffold(
      // ไม่ต้อง SafeArea ทั้งหน้า เพราะเรารองรับพื้นที่บนเอง
      body: SingleChildScrollView(
        padding: EdgeInsets.zero, // <- ให้ส่วนหัวเขียวเต็มจอ
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======= ส่วนหัวเขียว แบบเต็มจอ =======
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light, // ไอคอนสถานะเป็นสีอ่อน
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: top + 16, // เผื่อพื้นที่ใต้ notch
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade400, Colors.green.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // ทำโค้งแค่ด้านล่างให้สวย
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: const _WelcomeHeader(),
              ),
            ),

            // เนื้อหาอื่น ๆ ของหน้า: เราค่อยใส่ padding รอบ ๆ ตรงนี้
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==== Today's Impact ====
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.eco, color: Colors.blue[600], size: 32),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ผลกระทบวันนี้',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[800],
                                  )),
                              Text('2.3 kg CO₂ ที่ลดได้',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[600],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            '+15 แต้ม',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==== Quick Actions ====
                  Text(
                    'การทำความสะอาดด่วน',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Cleanup Cards (ใช้โมเดลแบบที่คุณเขียนอยู่)
                  CleanupCard(
                    task: CleanupTask(
                      title: 'ลบอีเมลขยะ',
                      description: 'ลบอีเมลที่ไม่ต้องการและสแปม',
                      icon: Icons.email,
                      estimatedImpact: '0.5 kg CO₂',
                      points: 10,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CleanupCard(
                    task: CleanupTask(
                      title: 'จัดการรูปภาพ',
                      description: 'ลบรูปซ้ำและรูปที่เบลอ',
                      icon: Icons.photo_library,
                      estimatedImpact: '1.2 kg CO₂',
                      points: 25,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CleanupCard(
                    task: CleanupTask(
                      title: 'ล้างแคช',
                      description: 'ลบไฟล์แคชและไฟล์ชั่วคราว',
                      icon: Icons.cached,
                      estimatedImpact: '0.3 kg CO₂',
                      points: 5,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==== Weekly Challenge ====
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[400]!, Colors.pink[400]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: const [
                          Icon(Icons.stars, color: Colors.white),
                          SizedBox(width: 8),
                          Text('ชาเลนจ์ประจำสัปดาห์',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ]),
                        const SizedBox(height: 8),
                        const Text('ลดคาร์บอน 10 kg ใน 7 วัน',
                            style: TextStyle(color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Expanded(
                              child: LinearProgressIndicator(
                                value: 0.6,
                                backgroundColor: Colors.white30,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text('6/10 kg',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
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

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('สวัสดี! 🌱',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('มาช่วยกันลดมลพิษดิจิทัลกันเถอะ',
            style: TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    );
  }
}
