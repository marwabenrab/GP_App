//import 'package:fikra_app/models/product.dart';
import 'package:fikra_app/widgets/product_body.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class  HomeScreen extends StatefulWidget {
  static const String screenRoute = 'homescreen';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String radioValue = 'option1';
  double kValue =  product[selected_index].kValue;
  double pValue = product[selected_index].pValue;
  double nValue = product[selected_index].nValue;
  double channelValue = product[selected_index].channelValue;
  double fertilizerQuantity = product[selected_index].fertilizerQuantity;
  


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حاسبة الأسمدة'),
         // actions: [
           // IconButton(
            //  icon: const Icon(Icons.arrow_forward),
            //  onPressed: () {
                // TODO: Implement forward action
             // },
            //),
          //],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'أدخل المعلومات ذات الصلة على',
                    suffixIcon: Icon(Icons.check_circle, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    GestureDetector(
      onTap: () {
        _showDialog('K', kValue, (value) {
          setState(() {
            kValue = value;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 76, 159, 88)), // إضافة حدود للمربع
          borderRadius: BorderRadius.circular(8.0), // تقريب الزوايا
          boxShadow: [ // إضافة ظل للمربع
            BoxShadow(
              color: Color.fromARGB(255, 148, 187, 144).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2), // تحديد اتجاه الظل
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text('K:$kValue'),
      ),
    ),
    GestureDetector(
      onTap: () {
        _showDialog('P', pValue, (value) {
          setState(() {
            pValue = value;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:const Color.fromARGB(255, 76, 159, 88)), // إضافة حدود للمربع
          borderRadius: BorderRadius.circular(8.0), // تقريب الزوايا
          boxShadow: [ // إضافة ظل للمربع
            BoxShadow(
              color: const Color.fromARGB(255, 148, 187, 144).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset:const Offset(0, 2), // تحديد اتجاه الظل
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text('P:$pValue'),
      ),
    ),
    GestureDetector(
      onTap: () {
        _showDialog('N', nValue, (value) {
          setState(() {
            nValue = value;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 76, 159, 88)), // إضافة حدود للمربع
          borderRadius: BorderRadius.circular(8.0), // تقريب الزوايا
          boxShadow: [ // إضافة ظل للمربع
            BoxShadow(
              color: const Color.fromARGB(255, 148, 187, 144).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2), // تحديد اتجاه الظل
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text('N:$nValue'),
      ),
    ),
  ],
),

                const SizedBox(height: 20),
                RadioListTile<String>(
                  title: const Text('هكتار'),
                  value: 'option1',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('فدان'),
                  value: 'option2',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                    'يتم تقديم عرض عن السماد الأمثل مرة واحدة كل 0.5 متر مكعب تقريباً'),
                const SizedBox(height: 30),
              
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            channelValue -= 1;
          });
        },
        icon:const Icon(Icons.remove),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:const Color.fromARGB(255, 76, 159, 88)),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color:const Color.fromARGB(255, 148, 187, 144).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset:const Offset(0, 2),
            ),
          ],
        ),
        padding:const EdgeInsets.all(8.0),
        child: Text('$channelValue فدان'),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset:const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            channelValue += 1;
          });
        },
        icon:const Icon(Icons.add),
      ),
    ),
  ],
),

    const SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {
    setState(() {
      fertilizerQuantity = _calculateFertilizerQuantity();
    });
    },
    child: Container(
    decoration: BoxDecoration(
      //border: Border.all(color: Color.fromARGB(255, 187, 190, 192)),
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 164, 170, 175).withOpacity(0.0),
        //spreadRadius: 2,
          //blurRadius: 7,
       //   offset: Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    child: const Text('احسب', style: TextStyle(fontSize: 16, color: Colors.green)),
  ),
),
const SizedBox(height: 40),
Container(
  decoration: BoxDecoration(
    border: Border.all(color:const Color.fromARGB(255, 87, 175, 117)),
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 87, 153, 87).withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 2),
      ),
    ],
    
  ),

  padding:const EdgeInsets.all(8.0),
  child: Text('كمية السماد المطلوبة: $fertilizerQuantity', style:const TextStyle(fontSize: 16)),
),

   const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String nutrient, double value, Function(double) onChanged) {
    double? newValue;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تعديل قيمة $nutrient'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextFormField(
                  initialValue: value.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (newValueText) {
                    newValue = double.tryParse(newValueText);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                if (newValue != null) {
                  onChanged(newValue!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  double _calculateFertilizerQuantity() {
    // التحقق من عدم وجود قيم سالبة
    if (kValue < 0 || pValue < 0 || nValue < 0 || channelValue < 0) {
      return 0;
    }

    // قيمة المساحة الإجمالية للأرض
    double landArea = radioValue == 'option1'
        ? channelValue * 10000
        : channelValue *
            4047; // إذا كانت الوحدة هكتار فسنقوم بتحويل الفدان إلى متر مربع

    // حساب كمية السماد المطلوبة بناءً على المساحة وقيم العناصر الغذائية
    double fertilizerQuantity = (kValue + pValue + nValue) * landArea;

    return fertilizerQuantity;
  }
}











