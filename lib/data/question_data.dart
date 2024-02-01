import 'package:quizz/model/question.dart';

class QuestionData {
  List<Question> questionList = [
    Question(
        question: "Il faut généralement un mois à un paresseux pour parcourir 1 km.",
        response: true,
        explanation: 'C’est un animal qui dort plus de 18h par jour et qui se déplace au maximum à 12 m/h lorsqu’il est menacé.',
        imagePath: 'sleep.webp'
    ),
    Question(
        question: "Le château de Versailles est composé de 500 pièces.",
        response: false,
        explanation: "Les 2300 pièces du château s’étendent sur un total de 63 154 m²",
        imagePath: 'castle.jpg'
    ),
    Question(
        question: "La sieste était une discipline olympique jusqu'en 1948.",
        response: false,
        explanation: "On aurait voulu y croire mais c'est faux par contre la peinture en était une",
        imagePath: 'paint.jpg'),
    Question(
        question: "Plus d'un milliard de photo sont prises chaque jour dans le monde.",
        response: true,
        explanation: "Il n’y avait que 600 millions de photos par jour en 2013. À titre de comparaison, nous prenons en 1 minute autant que photos que durant tout le XIXe siècle.",
        imagePath: 'photo.jpeg'
    ),
    Question(
        question: "Les dauphins ont des comportements violents avec les femelles qui peuvent s'apparenter à des viols.",
        response: true,
        explanation: "Bien que le concept de viol soit difficile à définir chez les animaux, certains chercheurs ont identifié des comportements sexuels chez les dauphins, où des mâles forcent des femelles à s’accoupler avec eux en les menaçant, les blessant ou les isolant.",
        imagePath: 'dauphin.jpg'
    ),
    Question(
        question: "En Allemagne faire l'amour en public est légal.",
        response: false,
        explanation: "C'est faux, par contre Il n'est pas illégal de s'évader de prison en Allemagne. Ils considèrent que c'est un instinct fondamental chez les humains de s'échapper pour être libre.",
        imagePath: 'allemagne.jpg'
    ),
    Question(
        question: "Nous passons plus de 1000 jours dans une vie sur les toilettes.",
        response: true,
        explanation: 'En effet cela représente 3 ans,',
        imagePath: 'toilette.jpeg'
    ),
    Question(
        question: "Les éléphants peuvent respirer par l'anus.",
        response: false,
        explanation: "C'est faux, mais certaines espèces de tortues aquatiques peuvent respirer par l’anus pour rester dans l’eau plus longtemps.",
        imagePath: 'elephant.jpg'
    ),
    Question(
        question: "Les escargots entraînent le décès d'environ 100.000 personnes chaque année.",
        response: true,
        explanation: "L'escargot transmet un parasite qui s’appelle le schistosome à l'origine de la schistosomiase (ou bilharziose), maladie chronique responsable de milliers de décès chaque année.",
        imagePath: 'escargot.webp'
    ),
    Question(
        question: "Il faut lire la documentation quand on est développeur",
        response: true,
        explanation: "La lecture de la documentation est cruciale pour les développeurs, offrant une compréhension approfondie, la résolution rapide des problèmes, et assurant une utilisation efficace des technologies - source Chat Gpt",
        imagePath: 'doc.jpg'
    )
  ];
}