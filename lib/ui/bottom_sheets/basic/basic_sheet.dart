import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'basic_sheet_model.dart';

class BasicSheet extends StackedView<BasicSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const BasicSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BasicSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          if (request.description != null) ...[
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14,),
              maxLines: 3,
              softWrap: true,
            ),
          ],
        ],
      ),
    );
  }

  @override
  BasicSheetModel viewModelBuilder(BuildContext context) => BasicSheetModel();
}
