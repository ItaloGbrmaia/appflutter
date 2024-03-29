class ArticleModelID {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String authorName;
  final String url;
  final int premium;
  final int order;
  final String image;
  final String fullText;
  final String authorimage;
  final String authordescription;

  ArticleModelID(
      {required this.id,
      required this.text,
      required this.title,
      required this.imageUrl,
      required this.authorName,
      required this.url,
      required this.premium,
      required this.order,
      required this.image,
      required this.authordescription,
      required this.fullText,
      required this.authorimage});

  factory ArticleModelID.fromJson(Map<String, dynamic> json) {
    return ArticleModelID(
      authorimage: json['author_image'] ?? '',
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      authorName: json['author_name'] ?? '',
      url: json['url'] ?? '',
      premium: json['premium'] ?? 0,
      order: json['order'] ?? 0,
      image: json['image_url'] ?? '',
      fullText: json['full_text'] ?? '',
      authordescription: json['author_description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': url,
      'premium': premium,
      'order': order,
      'image': image,
      'full_text': fullText,
      'author_image': authorimage,
      'author_description': authordescription
    };
  }
}


//  "full_text": "<p>\"Temos falado muito da possibilidade de mudan&ccedil;a. Como isso acontece no contexto da forma&ccedil;&atilde;o contemplativa? Sabemos que as emo&ccedil;&otilde;es duram alguns segundos, que os humores duram, digamos, um dia, e que o temperamento &eacute; algo que se modela com o passar dos anos. Portanto, se queremos mudar, &eacute; obvio que precisamos primeiro agir com rela&ccedil;&atilde;o &agrave;s emo&ccedil;&otilde;es, e isso ajudar&aacute; a modificar nossos humores, que, por fim, se estabilizar&atilde;o na forma de um temperamento modificado. Em outras palavras, precisamos come&ccedil;ar a trabalhar com os acontecimentos instant&acirc;neos que ocorrem na mente. Como dizemos, se cuidarmos dos minutos, as horas cuidar&atilde;o de si mesmas. Portanto, uma das quest&otilde;es principais tem rela&ccedil;&atilde;o com o modo como ocorre o encadeamento dos pensamentos, o modo de como um pensamento leva ao outro.&nbsp;<br /><br />Meu professor me contou uma hist&oacute;ria a respeito de um ex-chefe guerreiro do leste do Tibet que abandonou todas as atividades marciais e mundanas, e foi para uma caverna meditar. Passou alguns anos ali. Certo dia um bando de pombos pousou em frente &agrave; caverna e ele lhes deu um punhado de gr&atilde;os. Enquanto observava, por&eacute;m, os pombos lhe lembraram as legi&otilde;es de guerreiros que ele tivera sob seu comando, e isso fez lembrar-se das expedi&ccedil;&otilde;es &ndash; e ficou irado novamente ao pensar nos antigos inimigos. Essas recorda&ccedil;&otilde;es logo lhe invadiram a mente e ele desceu ao vale, encontrou os antigos companheiros e voltou a guerra! Isso exemplifica como um pequeno pensamento pode tornar-se uma obsess&atilde;o, como uma min&uacute;scula nuvem branca cresce e se transforma numa imensa nuvem escura repleta de raios. Como lidar com isso? Quando falamos em medita&ccedil;&atilde;o, a palavra usada em tibetano significa, na verdade, &ldquo;familiariza&ccedil;&atilde;o&rdquo;.<br /><br />Precisamos nos familiarizar com um novo modo de lidar com o surgimento dos pensamentos. No in&iacute;cio, quando surge um pensamento de ira, desejo ou ci&uacute;me, n&atilde;o estamos preparados para ele. Portanto, em poucos segundos, esse pensamento d&aacute; origem a um segundo e a um terceiro, e logo nosso panorama mental &eacute; invadido por pensamentos que solidificam nossa raiva ou ci&uacute;me e, ent&atilde;o, &eacute; tarde demais. Assim acontece quando uma fa&iacute;sca incendeia uma floresta, e estamos em apuros.<br /><br />A maneira elementar de intervir chama-se &ldquo;olhar para tr&aacute;s&rdquo;, para o pensamento. Quando surge um pensamento, precisamos observ&aacute;-lo e observar sua fonte. Precisamos investigar a natureza desse pensamento que parece t&atilde;o s&oacute;lido. Ao encar&aacute;-lo, sua solidez t&atilde;o &oacute;bvia se derrete e o pensamento se extingue sem dar origem a um encadeamento de pensamentos. A quest&atilde;o n&atilde;o &eacute; tentar bloquear o surgimento de pensamentos &ndash; isso nem &eacute; mesmo poss&iacute;vel &ndash; mas n&atilde;o deix&aacute;-lo invadir nossa mente. Precisamos faz&ecirc;-lo diversas vezes porque n&atilde;o estamos acostumados a lidar com os pensamentos dessa maneira.&nbsp;<br /><br />Somos iguais a uma folha de papel que ficou muito tempo enrolada. Quando tentamos abri-la sobre a mesa, ela se enrola de novo no instante em que erguemos as m&atilde;os. &Eacute; assim que se realiza o treinamento. Talvez haja quem pergunte o que as pessoas fazem nos retiros, passando oito horas por dia sentados. Fazem exatamente isso: familiarizam-se com um novo modo de lidar com o surgimento dos pensamentos. Quando come&ccedil;amos a nos acostumar com o reconhecimento dos pensamentos &eacute; como se f&ocirc;ssemos capazes de identificar rapidamente numa multid&atilde;o algu&eacute;m que conhecemos. Quando surge um pensamento potente de forte atra&ccedil;&atilde;o ou raiva sabemos que vai levar a uma prolifera&ccedil;&atilde;o de pensamentos, passamos a reconhec&ecirc;-lo: &ldquo;Ah, l&aacute; vem essa id&eacute;ia!&rdquo;. Esse &eacute; o primeiro passo. Ajuda muito a evitar que tal pensamento o domine. Depois de se acostumar com isso, o processo de lidar com os pensamentos se torna mais natural. N&atilde;o &eacute; preciso lutar e aplicar ant&iacute;dotos espec&iacute;ficos a cada pensamento negativo, porque sabemos como deix&aacute;-lo se esvaecer sem deixar vest&iacute;gios. Os pensamentos se desamarram. O exemplo dado &eacute; o de uma cobra. Se ela &eacute; der um n&oacute; no corpo, consegue desfazer esse n&oacute; sem esfor&ccedil;o, sem precisar de nenhuma ajuda externa. Por fim, haver&aacute; uma &eacute;poca em que os pensamentos chegar&atilde;o e partir&atilde;o como um p&aacute;ssaro que passa pelo c&eacute;u, sem deixar vest&iacute;gios.<br /><br />Outro exemplo dado &eacute; o do ladr&atilde;o que entra numa casa vazia. O propriet&aacute;rio n&atilde;o tem nada a perder e o ladr&atilde;o n&atilde;o tem nada a ganhar. &Eacute; uma experi&ecirc;ncia de liberdade. N&atilde;o nos tornamos simplesmente ap&aacute;ticos, como vegetais, mas passamos a dominar os pensamentos. Eles n&atilde;o nos carregam mais pelas r&eacute;deas. Isso s&oacute; pode acontecer por interm&eacute;dio de treinamento constante e experi&ecirc;ncia genu&iacute;na. Tamb&eacute;m &eacute; assim que podemos, aos poucos, adquirir certas qualidades que passar&atilde;o a integrar nossa natureza, tornam-se um novo temperamento.\"<br /><br /><em>Este foi um trecho da fala de Matthieu Ricard, transcrita do livro&nbsp;<strong>\"Como lidar com emo&ccedil;&otilde;es destrutivas\"</strong>, que documenta a colabora&ccedil;&atilde;o entre o Dalai Lama e um grupo de cientistas para compreender e combater as emo&ccedil;&otilde;es destrutivas.</em></p>",
//     "author_image": null,
//     "author_description": "Cresceu no meio intelectual de Paris e doutorou-se em genética molecular. Aos 38 tornou-se monge budista; é autor do livro “Felicidade – A prática do Bem Estar”, “A arte de meditar” e “A revolução do altruísmo”.",
//     "image": "https://d2g3qjbxchhsv1.cloudfront.net/images/artigos/iamgeartigo2.jpg"
// }