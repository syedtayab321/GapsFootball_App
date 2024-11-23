import 'package:flutter/material.dart';
import '../../CustomWidgets/TextWidget.dart';

class AddServiceForm extends StatefulWidget {
  const AddServiceForm({super.key});

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  double price = 0.0;
  List<String> features = [];
  String? imagePath;

  final TextEditingController _featuresController = TextEditingController();

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const CustomTextWidget(
          title: "Add New Service",
          color: Colors.white,
          weight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Field
                const CustomTextWidget(
                  title: "Service Title",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: _inputDecoration("Enter service title"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  onSaved: (value) => title = value!,
                ),
                const SizedBox(height: 20),

                // Description Field
                const CustomTextWidget(
                  title: "Description",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 4,
                  decoration: _inputDecoration("Enter service description"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) => description = value!,
                ),
                const SizedBox(height: 20),

                // Price Field
                const CustomTextWidget(
                  title: "Price (\$)",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration("Enter price"),
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return "Please enter a valid price";
                    }
                    return null;
                  },
                  onSaved: (value) => price = double.parse(value!),
                ),
                const SizedBox(height: 20),

                // Features Section
                const CustomTextWidget(
                  title: "Features",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _featuresController,
                  decoration: _inputDecoration("Enter a feature").copyWith(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: (){},
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Display Features
                Wrap(
                  spacing: 8.0,
                  children: features.map((feature) {
                    final index = features.indexOf(feature);
                    return Chip(
                      label: Text(feature),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: (){},
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const CustomTextWidget(
                  title: "Image",
                  color: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: imagePath == null
                        ? const Center(
                      child: Text("Tap to upload image"),
                    )
                        : Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle submission logic
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
