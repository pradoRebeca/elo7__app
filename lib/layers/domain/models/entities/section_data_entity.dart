enum SectionType {
  highlight,
  meetOurTeam,
  workWithUs,
  sellerStatement,
}

class SectionDataEntity {
  final String? fileImageName;
  final String? detail;
  final String? title;
  final String? link;
  final SectionType sectionType;

  SectionDataEntity({
    this.fileImageName,
    this.detail,
    this.title,
    this.link,
    required this.sectionType,
  });
}
