import 'package:flutter/material.dart';

class AddWheat extends StatefulWidget {
  static const String screenRoute = 'add_wheat';

  @override
  _AddWheatState createState() => _AddWheatState();
}

class _AddWheatState extends State<AddWheat> {
  bool showTreatment = false; // Flag to show treatment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.book, size: 24),
                  SizedBox(width: 8),
                  Text('Symptoms', style: TextStyle(fontSize: 24)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'images/image10.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.asset(
                      'images/image18.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'The plant is characterized by wrinkling of leaves and branches. '
                'Wilting and yellowing of leaves and branches. '
                'Growth cessation. Low and medium numbers have no adverse effect '
                'on the plant. Severe infestations may cause leaf curling, '
                'branch twisting, and sometimes yellowing, wilting, and poor growth. '
                'A general decline in crop vigor will be observed, resulting from '
                'honeydew excretion, which may encourage additional infections '
                'from opportunistic fungal growth. This is manifested by mold growth '
                'on the plant surface. Honeydew attracts ants. Even low numbers '
                'of aphids can transmit viral diseases from one plant to another. '
                'The most favorable conditions for aphid reproduction and spread '
                'are warm, dry weather.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showTreatment = true;
                        });
                      },
                      child: Text('Treatment'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        elevation: showTreatment ? 10 : 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showTreatment = false;
                        });
                      },
                      child: Text('Prevention'),
                      style: ElevatedButton.styleFrom(
                        padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        elevation: showTreatment ? 0 : 10,
                      ),
                    ),
                  ),
                ],
              ),
              if (showTreatment)
              const   Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommendations:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'In case of moderate infections, a solution of insecticidal soap or solutions containing plant oils such as neem oil (3 ml per liter) can be used. Additionally, many fungi can infect and kill the mites if suitable humid conditions are available. Spraying water on the affected plants may also yield good results and eliminate mite colonies.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


/*Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            showTreatment = true; // إظهار صفحة المعالجة
          });
        },
        child: Text('المعالجة'),
        style: ElevatedButton.styleFrom(
          padding:const EdgeInsets.symmetric(vertical: 20, horizontal:60), // زيادة حجم الزر
          elevation: showTreatment ? 10 : 0, // إضافة ظل إذا كان الزر مختارًا
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            showTreatment = false; // إخفاء صفحة المعالجة
          });
        },
        child: Text('الوقاية'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60), // زيادة حجم الزر
          elevation: showTreatment ? 0 : 10, // إضافة ظل إذا كان الزر مختارًا
        ),
      ),
    ),*/