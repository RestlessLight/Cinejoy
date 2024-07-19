import 'package:cinejoy/models/movie.dart';

final movies = [
  Movie(
    id: '1',
    image: 'https://static.ukrinform.com/photos/2024_01/1704454383-852.jpeg',
    title: 'Я, Побєда і Берлін',
    rating: 'G',
    genre: 'Adventure',
    description:
        '90-ті. За три дні до запланованого концерту музикант-початківець Кузьма вирушає зі своїм другом Бардом до Берліна на старій «Побєді». Кажуть, там є колекціонер, готовий обміняти жовту бестію на шестисотий «Мерс». Кузьма обіцяє своїй дівчині Барбарі повернутися додому на новій тачці, а хлопцям з гурту — встигнути на виступ. Проте все йде не за планом.',
    startDate: DateTime(2024, 1, 25),
    endDate: DateTime(2024, 6, 30),
    duration: const Duration(hours: 2, minutes: 10),
    cast: 'Іван Бліндар, Володимир Гева, Марія Стопник',
  ),
  Movie(
      id: '2',
      image:
          'https://assets-prd.ignimgs.com/2024/01/24/dune2-insta-vert-montage-1638x2048-intl-1706086846940.jpg',
      title: 'Dune',
      rating: 'M',
      genre: 'Sci-Fi',
      description:
          'Фантастичний бойовик «Дюна. Частина друга» є продовженням фільму, що вийшов на екрани у 2021 році. У основу сюжету покладено однойменний роман Френка Герберта. За мотивами книги створено низку відеоігор та настільних ігор. Книга вийшла друком 1965 року і відтоді її неодноразово намагалися екранізувати. Тривалий час це нікому не вдавалося. 1984 року з’явилася версія режисера Девіда Лінча, проте вона не мала успіху. Дені Вільньов став режисером першого фільму та продовжив роботу над другою частиною. Робота над нею розпочалася у серпні 2021 року.',
      startDate: DateTime(2024, 3, 12),
      endDate: DateTime(2024, 9, 11),
      duration: const Duration(hours: 3, minutes: 30),
      cast:
          'Timothée Chalamet, Rebecca Ferguson, Oscar Isaac, Josh Brolin, Stellan Skarsgård, Dave Bautista, Stephen McKinley Henderson, Zendaya, Chang Chen, Sharon Duncan-Brewster, Charlotte Rampling, Jason Momoa, Javier Bardem'),
  Movie(
      id: '3',
      image:
          'https://image.tmdb.org/t/p/original/t53JnqVsQ9H0SZMD8IcRGJiL9M3.jpg',
      title: 'Королівство планети мавп',
      rating: 'R',
      genre: 'Adventure/Sci-Fi',
      description:
          'Фантастичний бойовик «Королівство планети мавп» є прямим продовженням фільму «Війна за планету мавп», що вийшов у 2017 році та четвертим фільмом перезапуску франшизи «Планета мавп». Про ідею цього фільму говорили ще у 2016 році. У 2019 році компанія Walt Disney оголосила, що у розробці знаходяться нові фільми та їх події розгортатимуться у тому ж всесвіті, що й фільм «Повстання планети мавп» 2011 року . Передбачається, що на екрани вийде ще щонайменше 2 фільми',
      startDate: DateTime(2024, 8, 1),
      endDate: DateTime(2024, 12, 2),
      duration: const Duration(hours: 1, minutes: 50),
      cast:
          'Owen Teague, Freya Allan,Kevin Durand, Peter Macon, William H. Macy'),
  Movie(
      id: '4',
      image:
          'https://static0.srcdn.com/wordpress/wp-content/uploads/2023/12/if-2024-movie-poster-featuring-a-purple-monster-hand-reaching-out-a-window.jpeg',
      title: 'IF',
      rating: 'G',
      genre: 'Adventure',
      description:
          'У фільмі розповідається про юну дівчину та її сусіда, які можуть бачити уявних друзів інших людей.',
      startDate: DateTime(2024, 9, 17),
      endDate: DateTime(2025, 3, 20),
      duration: const Duration(hours: 1, minutes: 20),
      cast:
          'Cailey Fleming, Ryan Reynolds, John Krasinski, Phoebe Waller-Bridge, Louis Gossett Jr., Steve Carell'),
];
