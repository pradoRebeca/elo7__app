import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/components/text_button_link_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';
import 'package:elo7_app/layers/presentation/components/highlight_image_card.dart';

void main() {
  testWidgets('HighlightImageCard renders correctly with all fields',
      (WidgetTester tester) async {
    final sectionDataEntity = SectionDataEntity(
      fileImageName: 'image.png',
      title: 'Título Exemplo',
      detail: 'Detalhe do exemplo.',
      link: 'http://example.com',
      sectionType: SectionType.highlight,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HighlightImageCard(sectionDataEntity: sectionDataEntity),
        ),
      ),
    );

    expect(find.byType(ImageCard), findsOneWidget);
    expect(find.text('Título Exemplo'), findsOneWidget);
    expect(find.text('Detalhe do exemplo.'), findsOneWidget);
    expect(find.byType(TextButtonLinkWebview), findsOneWidget);
  });

  testWidgets('HighlightImageCard hides image when fileImageName is null',
      (WidgetTester tester) async {
    final sectionDataEntity = SectionDataEntity(
      fileImageName: null,
      title: 'Título Exemplo',
      detail: 'Detalhe do exemplo.',
      link: 'http://example.com',
      sectionType: SectionType.highlight,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HighlightImageCard(sectionDataEntity: sectionDataEntity),
        ),
      ),
    );

    // Assert
    expect(find.text('Título Exemplo'), findsOneWidget);
  });

  testWidgets('HighlightImageCard hides title when title is empty',
      (WidgetTester tester) async {
    final sectionDataEntity = SectionDataEntity(
      fileImageName: 'image.png',
      title: '',
      detail: 'Detalhe do exemplo.',
      link: 'http://example.com',
      sectionType: SectionType.highlight,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HighlightImageCard(sectionDataEntity: sectionDataEntity),
        ),
      ),
    );

    expect(find.text('Título Exemplo'), findsNothing);
  });

  testWidgets('HighlightImageCard hides detail when detail is empty',
      (WidgetTester tester) async {
    final sectionDataEntity = SectionDataEntity(
      fileImageName: 'image.png',
      title: 'Título Exemplo',
      detail: '',
      link: 'http://example.com',
      sectionType: SectionType.highlight,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HighlightImageCard(sectionDataEntity: sectionDataEntity),
        ),
      ),
    );

    expect(find.text('Detalhe do exemplo.'), findsNothing);
  });

  testWidgets('HighlightImageCard does not render link when link is null',
      (WidgetTester tester) async {
    final sectionDataEntity = SectionDataEntity(
      fileImageName: 'image.png',
      title: 'Título Exemplo',
      detail: 'Detalhe do exemplo.',
      link: null,
      sectionType: SectionType.highlight,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HighlightImageCard(sectionDataEntity: sectionDataEntity),
        ),
      ),
    );

    expect(find.byType(TextButtonLinkWebview), findsNothing);
  });
}
