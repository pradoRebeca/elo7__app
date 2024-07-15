import 'package:elo7_app/layers/domain/models/entities/section_data_entity.dart';

final List<SectionDataEntity> sectionDataEntityList = [
  ...workWithUsSection,
  ...sellerStatementSection,
  ...meetOurTeamSection,
  ...highLightsSection,
];

final List<SectionDataEntity> workWithUsSection = [
  SectionDataEntity(
    detail:
        'Somos uma empresa criativa, tecnológica, humana e, por isso, completamente única. Nos comprometemos com a construção de um ambiente de trabalho diverso, por isso todas as candidaturas feitas serão consideradas, sem distinção de raça, etnia, religião, identidade de gênero, orientação sexual, nacionalidade, deficiência ou idade. Venha fazer parte!',
    link: 'https://elo7.gupy.io/',
    titleLink: 'Nossas vagas',
    sectionType: SectionType.workWithUs,
  ),
];

final List<SectionDataEntity> sellerStatementSection = [
  SectionDataEntity(
    detail:
        'Sou lojista desde 2010. Todo o trabalho realizado nesses 8 anos foi e continua sendo feito com o máximo de amor. Participar da vida de cada cliente com uma peça tão simbólica faz meu trabalho ser apaixonante.',
    title: 'Regina Bijoux',
    sectionType: SectionType.sellerStatement,
  ),
];

final List<SectionDataEntity> meetOurTeamSection = [
  SectionDataEntity(
    fileImageName: 'sellers/seller_1.png',
    sectionType: SectionType.meetOurTeam,
  ),
  SectionDataEntity(
    fileImageName: 'sellers/seller_2.png',
    sectionType: SectionType.meetOurTeam,
  ),
  SectionDataEntity(
    fileImageName: 'sellers/seller_3.png',
    sectionType: SectionType.meetOurTeam,
  ),
  SectionDataEntity(
    fileImageName: 'sellers/seller_4.png',
    sectionType: SectionType.meetOurTeam,
  ),
];

final List<SectionDataEntity> highLightsSection = [
  SectionDataEntity(
    fileImageName: 'highlight/image_file.png',
    detail:
        'Hoje, abrimos espaço para mais de 130 mil criativos de todo o país compartilharem seus produtos autorais e personalizados em nossa plataforma.',
    title: 'Resultados',
    sectionType: SectionType.highlight,
  ),
  SectionDataEntity(
    fileImageName: 'highlight/like.png',
    detail:
        'Podemos realmente transformar a vida de milhares de pessoas ao apoiar pequenos empreendedores e suas famílias. Constatamos aqui a relevância dos diferenciais dos empreendedores do Elo7.',
    title: 'Qualidade de vida',
    link:
        'https://blog.elo7.com.br/categorias/negocio-criativo/historias-de-sucesso',
    titleLink: 'Nossas histórias',
    sectionType: SectionType.highlight,
  ),
  SectionDataEntity(
    fileImageName: 'highlight/safe.png',
    detail:
        'Nossa cultura é pautada em quatro pilares dos nossos valores: Humanização, Empreendedorismo, Criatividade e Tecnologia! ',
    title: 'Nossos valores',
    sectionType: SectionType.highlight,
  ),
];
