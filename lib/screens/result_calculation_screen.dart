import 'package:flutter/material.dart';

class ResultCalculationScreen extends StatefulWidget {
  const ResultCalculationScreen({super.key});

  @override
  State<ResultCalculationScreen> createState() =>
      _ResultCalculationScreenState();
}

class _ResultCalculationScreenState extends State<ResultCalculationScreen> {
  List<TextEditingController> resultInputTEController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  double cgpa = 0.0;
  bool showResult = false;

  List<double> weights = [5.0, 5.0, 10.0, 10.0, 20.0, 20.0, 20.0, 10.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Calculate Your CGPA",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text("Enter ${index + 1} semester CGPA"),
                        ),

                        TextFormField(
                          controller: resultInputTEController[index],
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  calculateCGPA();
                  if (showResult) {
                  }
                },
                child: Text(
                  "Show Result",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void calculateCGPA() {
    double total = 0.0;
    bool valid = true;

    for (int i = 0; i < 8; i++) {
      String inputResult = resultInputTEController[i].text;

      if (inputResult.isEmpty ||
          !RegExp(r'^\d\.\d{1,2}$').hasMatch(inputResult)) {
        valid = false;
        break;
      }
      double gpa = double.tryParse(inputResult) ?? 0.0;
      if (gpa < 0 || gpa > 4.0) {
        valid = false;
        break;
      }
      total += gpa * (weights[i] / 100.0);
    }

    if (valid) {
      setState(() {
        cgpa = total;
        showResult = true;
      });


      resultShowDialog(cgpa.toStringAsFixed(2));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Input  Use X.XX format (0-4.00)')),
      );
    }
  }

  void resultShowDialog(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Result"),

        icon: CircleAvatar(
          child: Icon(Icons.check, size: 40, color: Colors.blue),
        ),
        content: Text(
          "Your result  is $result",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


}
