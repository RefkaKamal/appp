import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedBlood;
  String? selectedHospital;
  int quantity = 1;

  final Map<String, int> bloodQty = {
    'A+': 10,
    'A-': 4,
    'B+': 6,
    'B-': 2,
    'AB+': 3,
    'AB-': 1,
    'O+': 12,
    'O-': 5,
  };

  final List<String> hospitals = [
    'مستشفى السلام',
    'مستشفى الشفاء',
    'مستشفى النيل',
  ];

  bool get isFormValid => selectedBlood != null && selectedHospital != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xff00A8A8),
        elevation: 0,
        title: const Text(
          'حجز أكياس الدم',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 16),

            /// اختيار فصيلة الدم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
                physics: const NeverScrollableScrollPhysics(),
                children: bloodQty.keys.map((type) {
                  final isSelected = selectedBlood == type;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBlood = type;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xff00A8A8) : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xff00A8A8),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            type,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Qty: ${bloodQty[type]}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white70 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            /// اختيار المستشفى
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text('اختر المستشفى'),
                    value: selectedHospital,
                    items: hospitals
                        .map(
                          (h) => DropdownMenuItem(
                            value: h,
                            child: Text(h),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedHospital = value;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// اختيار الكمية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: quantity > 1
                      ? () {
                          setState(() {
                            quantity--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),

      /// زرار Next
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: isFormValid
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم الحجز بنجاح!')),
                  );
                }
              : null,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isFormValid ? const Color(0xFF00A7B3) : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}