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
  final String? titleLink;
  final SectionType sectionType;

  SectionDataEntity({
    this.fileImageName,
    this.detail,
    this.title,
    this.link,
    this.titleLink,
    required this.sectionType,
  });
}
