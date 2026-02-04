import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:news/Provider/theme_provider.dart';
import 'package:provider/provider.dart';

class DropdownList<T> extends StatelessWidget {
  final T? value;
  final Map<T, String> itemsMap;
  final Function(T?) onChanged;

  const DropdownList({
    super.key,
    required this.value,
    required this.itemsMap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    final T? currentValue = itemsMap.containsKey(value) ? value : null;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        value: currentValue,
        items: itemsMap.entries.map((entry) {
          return DropdownMenuItem<T>(
            value: entry.key,
            child: Text(
              entry.value,
              style:  Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color:Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                width: 2,
                color:Theme.of(context).colorScheme.primary),

          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}