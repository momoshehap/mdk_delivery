import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:MDKDelivery/presentation/widgets/customer_componants.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSearchbar(),
            Expanded(
              child: ConditionalBuilder(
                condition: true,
                builder: (context) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return buildCustomerCard();
                  },
                  itemCount: 10,
                ),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff155079),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
