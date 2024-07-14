import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.onSearch});

  final void Function(String text) onSearch;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodySmall,
      controller: _searchController,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSearch,
      decoration: InputDecoration(
          hintText: 'nome da vaga',
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () => widget.onSearch(_searchController.text),
          )),
    );
  }
}
