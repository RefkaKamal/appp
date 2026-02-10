import 'package:flutter/material.dart';

class BloodTypesPage extends StatelessWidget {
  const BloodTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'الرئيسية',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.local_shipping),
                  label: const Text('توصيل'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1FA5A9),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bloodtype),
                  label: const Text('حجز أكياس دم'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1FA5A9),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// العنوان
          const Text(
            'من يتبرع لمن؟',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 12),

          /// قائمة الفصائل
          const BloodRow(
            type: 'O-',
            donate: 'A+, A-, B+, B-, AB+, AB-, O+, O-',
            receive: 'O-',
          ),
          const BloodRow(
            type: 'O+',
            donate: 'A+, B+, AB+, O+',
            receive: 'O+, O-',
          ),
          const BloodRow(
            type: 'A-',
            donate: 'A+, A-, AB+, AB-',
            receive: 'A-, O-',
          ),
          const BloodRow(
            type: 'A+',
            donate: 'A+, AB+',
            receive: 'A+, A-, O-',
          ),
          const BloodRow(
            type: 'B-',
            donate: 'B+, B-, AB+, AB-',
            receive: 'B-, O-',
          ),
          const BloodRow(
            type: 'B+',
            donate: 'B+, AB+',
            receive: 'B+, B-, O-',
          ),
          const BloodRow(
            type: 'AB-',
            donate: 'AB+, AB-',
            receive: 'A-, B-, AB-, O-',
          ),
          const BloodRow(
            type: 'AB+',
            donate: 'AB+',
            receive: 'الجميع',
          ),
        ],
      ),
    );
  }
}

/// Widget لكل فصيلة دم
class BloodRow extends StatelessWidget {
  final String type;
  final String donate;
  final String receive;

  const BloodRow({
    super.key,
    required this.type,
    required this.donate,
    required this.receive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          /// (نقطة دم اللي يجيلها نقطة)
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.water_drop,
                size: 50,
                color: Color(0xff1FA5A9),
              ),
              Text(
                type,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// يتبرع لـ
                  Row(
                    children: [
                      const Icon(
                        Icons.volunteer_activism,
                        size: 18,
                        color: Color(0xff1FA5A9),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'يتبرع لـ:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          donate,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// يستقبل من
                  Row(
                    children: [
                      const Icon(
                        Icons.call_received,
                        size: 17,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'يستقبل من:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          receive,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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