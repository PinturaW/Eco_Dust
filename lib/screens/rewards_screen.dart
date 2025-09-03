// screens/rewards_screen.dart
import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รางวัล & แต้ม'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Points Balance
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple[400]!, Colors.pink[400]!],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.stars,
                    size: 64,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '2,450',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'แต้มสะสม',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'อันดับ #47 ในประเทศ',
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

            // Achievements
            Text(
              'ความสำเร็จ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: _buildAchievement('🌱', 'มือใหม่', 'ลบไฟล์ครั้งแรก', true)),
                SizedBox(width: 12),
                Expanded(child: _buildAchievement('🚀', 'นักสำรวจ', 'สแกนหาขยะ 10 ครั้ง', true)),
              ],
            ),

            SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildAchievement('⚡', 'เร็วจัด', 'ทำความสะอาด 5 วันติด', false)),
                SizedBox(width: 12),
                Expanded(child: _buildAchievement('🌍', 'นักสู้โลก', 'ลดคาร์บอน 50kg', false)),
              ],
            ),

            SizedBox(height: 24),

            // Leaderboard
            Text(
              'อันดับผู้นำ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 16),

            _buildLeaderboardItem(1, 'EcoMaster2024', '5,240', '12.3 kg', true),
            _buildLeaderboardItem(2, 'GreenHero', '4,890', '11.8 kg', false),
            _buildLeaderboardItem(3, 'CleanFreak', '4,120', '9.7 kg', false),
            _buildLeaderboardItem(47, 'คุณ', '2,450', '8.5 kg', true, isUser: true),

            SizedBox(height: 24),

            // Rewards Shop
            Text(
              'ร้านแลกรางวัล',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 16),

            _buildRewardItem(
              'คูปองส่วนลด 10%',
              'ร้านค้าออนไลน์คู่ใจ',
              500,
              Icons.local_offer,
              Colors.red,
              true,
            ),

            SizedBox(height: 12),

            _buildRewardItem(
              'ปลูกต้นไม้ 1 ต้น',
              'ในนามของคุณ',
              1000,
              Icons.park,
              Colors.green,
              true,
            ),

            SizedBox(height: 12),

            _buildRewardItem(
              'เสื้อยืด Eco-Friendly',
              'ผลิตจากขวดรีไซเคิล',
              2500,
              Icons.checkroom,
              Colors.blue,
              false,
            ),

            SizedBox(height: 12),

            _buildRewardItem(
              'Power Bank พลังงานแสงอาทิตย์',
              'ชาร์จด้วยพลังงานสะอาด',
              5000,
              Icons.battery_charging_full,
              Colors.orange,
              false,
            ),

            SizedBox(height: 24),

            // Tips for earning points
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: Colors.green[600]),
                      SizedBox(width: 8),
                      Text(
                        'วิธีได้แต้มเพิ่ม',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• ทำความสะอาดทุกวัน: +5 แต้ม\n'
                    '• ชวนเพื่อนใช้แอป: +100 แต้ม\n'
                    '• แชร์ผลกระทบ: +20 แต้ม\n'
                    '• ทำชาเลนจ์สำเร็จ: +50 แต้ม',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[700],
                      height: 1.5,
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

  Widget _buildAchievement(String emoji, String title, String description, bool unlocked) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: unlocked ? Colors.yellow[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: unlocked ? Colors.yellow[300]! : Colors.grey[300]!,
        ),
      ),
      child: Column(
        children: [
          Text(
            emoji,
            style: TextStyle(
              fontSize: 32,
              color: unlocked ? null : Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: unlocked ? Colors.grey[800] : Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: unlocked ? Colors.grey[600] : Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String points, String co2, bool showCO2, {bool isUser = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUser ? Colors.purple[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUser ? Colors.purple[200]! : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: rank <= 3 ? Colors.yellow[400] : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: rank <= 3 ? Colors.white : Colors.grey[600],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isUser ? Colors.purple[800] : null,
                  ),
                ),
                if (showCO2)
                  Text(
                    'ลดคาร์บอน $co2',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$points แต้ม',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isUser ? Colors.purple[700] : Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem(String title, String description, int points, IconData icon, Color color, bool canRedeem) {
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '$points แต้ม',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: canRedeem ? () => _redeemReward(title, points) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canRedeem ? color : Colors.grey,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              canRedeem ? 'แลก' : 'ไม่พอ',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _redeemReward(String title, int points) {
    // Implement reward redemption
    print('Redeeming: $title for $points points');
  }
}