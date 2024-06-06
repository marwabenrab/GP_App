
/*import 'package:flutter/material.dart';
import 'package:fikra_app/widgets/custbuttom.dart';

class Paymentconst extends StatefulWidget {
  static const String screenRoute = 'paying_const';
  const Paymentconst({Key? key}) : super(key: key);

  @override
  State<Paymentconst> createState() => _PaymentconstState();
}

class _PaymentconstState extends State<Paymentconst> {
  late PageController _pageController;
  String? _selectedAddress;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Column(
          children: [
            SizedBox(height: 33,),
            Text(
              '  الدفع مرة واحدة ',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(70,70),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SizedBox(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
        const SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildCard(
                      index == 0 ? "**** **** **** 1696" : "**** **** **** 1234",
                      index == 0 ? "VALID 19/22" : "VALID 21/24",
                      index == 0 ? "images/Mastercard.png" : "images/visee.png",
                      index == 0 ? const Color(0xFF2a1214) : const Color(0xFF0000cc),
                      Colors.white,
                    );
                  },
                ),
              ),
            ),
          const  SizedBox(height: 20),
            CustButtom(
              text: "PAY/250,00 DA",
              onPressed: () {
                _showPaymentDetailsBottomSheet(context);
              },
            ),
        const    SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showPaymentDetailsBottomSheet(BuildContext context) {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // تمكين التمرير عند الحاجة
    builder: (BuildContext context) {
      return SingleChildScrollView( // استخدام SingleChildScrollView هنا
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // تحديد التباعد السفلي بناءً على ارتفاع الكيبورد
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                const  Text(
                    'أدخل معلومات البطاقة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: cardNumberController,
                    labelText: 'رقم البطاقة',
                  ),
                const  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: expiryDateController,
                          labelText: 'MM/YY',
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: CustomTextField(
                          controller: cvcController,
                          labelText: 'CVC',
                        ),
                      ),
                    ],
                  ),
                const  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedAddress,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedAddress = newValue;
                      });
                    },
                    items: <String>["عين الدفلى ", " عريب ", " خميس مليانة ", " الجزائر ", " العطاف "]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration:const InputDecoration(
                      labelText: 'اختر العنوان',
                      border: OutlineInputBorder(),
                    ),
                  ),
                const  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // استخدم البيانات المدخلة cardNumberController.text, cvcController.text, expiryDateController.text
                          // هنا يمكنك تنفيذ الإجراءات التي تحتاجها مثل التحقق من الصحة والتالي في الدفع وما إلى ذلك
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side:const BorderSide(color: Color.fromARGB(255, 42, 123, 56), width: 2),
                          ),
                        ),
                        child:const Text('الدفع', style: TextStyle(fontSize: 19)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

  Widget _buildCard(String cardNumber, String validity, String imagePath, Color cardColor, Color textColor) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(205, 141, 135, 135),
              offset: Offset(3, 7),
              blurRadius: 20,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imagePath,
                    width: 50,
                  ),
                  const  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                cardNumber,
                style: TextStyle(fontSize: 22, color: textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                validity,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
} */