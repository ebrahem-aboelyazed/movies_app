import 'package:flutter/material.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/utils/utils.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    required this.onChanged,
    this.controller,
    this.suffixIcon,
    this.height,
    this.width,
    this.hint,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final String? hint;
  final Widget? suffixIcon;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 56,
      width: widget.width ?? context.width,
      child: TextField(
        controller: controller,
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 20,
          ),
          hintText: widget.hint ?? context.l10n.search,
          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
            color: Colors.black,
          ),
          suffixIcon: widget.suffixIcon,
          border: Borders.searchBorder,
          enabledBorder: Borders.searchBorder,
          focusedBorder: Borders.searchBorder,
          errorBorder: Borders.searchBorder,
          focusedErrorBorder: Borders.searchBorder,
        ),
      ),
    );
  }
}
