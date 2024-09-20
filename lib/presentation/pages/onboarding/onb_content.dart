class OnbContent {
  final String image;
  final String title;
  final String description;

  OnbContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnbContent> contents = [
  OnbContent(
    title : "Kpaman",
    image: 'assets/house_searching.svg',
    description:"Trouvez facilement votre maison idéale à Abidjan. "
    "Accédez à des annonces vérifiées et contactez directement les propriétaires, sans intermédiaires."
   ,

  ),

  OnbContent(
    title : 'Securisez vous',
    image: 'assets/security.svg',
    description:"Rentrez en contact direct avec nos propriétaires"
                " verifiés et Louez en toute securité",

  ),

  OnbContent(
    title : "Gagnez du temps",
    image: 'assets/time_management.svg',
    description:" Votre nouveau chez vous juste   "
    "a quelques clics de vous avec Kpaman sans effort"
     "Cherchez et Louez depuis votre téléphone.",

  ),


];