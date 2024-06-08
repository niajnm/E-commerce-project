import 'package:e_commerce/app/app_widgets/TextFieldWithLabel.dart';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpansionItemListWidget extends StatefulWidget {
  final title;
  final icon;

  ExpansionItemListWidget({super.key, this.title, this.icon});

  @override
  State<ExpansionItemListWidget> createState() =>
      _ExpansionItemListWidgetState();
}

class _ExpansionItemListWidgetState extends State<ExpansionItemListWidget> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        child: ExpansionTile(
          trailing: const Icon(Icons.arrow_forward_ios),
          leading: Icon(widget.icon),
          title: Text(
            widget.title,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppValues.halfPadding),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _textField('youremail@xmail.com', _textEditingController),
                  const SizedBox(height: 20),
                  _textField('William Bennett', _textEditingController),
                  const SizedBox(height: 20),
                  _textField(
                      '465 Nolan Causeway Suite 079', _textEditingController),
                  const SizedBox(height: 20),
                  _textField('Unit 512', _textEditingController),
                  const SizedBox(height: 20),
                  _textField('Zip Code', _textEditingController),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(207, 29, 184, 151),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(4).r,
        border: Border.all(
          width: 2,
          color: AppColors.accentOrange,
        ),
      );

  Widget _textField(hint, controller) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
