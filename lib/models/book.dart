class Book{
  final String imageUrl;
  final String title;
  final String detail;
  final String rating;
  final String genres;

  Book({
    required this.rating,
    required this.title,
    required this.genres,
    required this.detail,
    required this.imageUrl
  });


}

List<Book>books = [
  Book(
      rating: '⭐⭐⭐⭐⭐',
      title: 'Muna Madan',
      genres: 'Romantic',
      detail: 'Muna Madan follows the life of Madan, a Chhetri man from Kathmandu who leaves Muna, his wife, to go to Lhasa to earn a fortune. He is cautioned against leaving by both Muna and his elderly mother, but he decides to leave anyway. While he initially intends to spend just a few weeks in Lhasa, he spends a longer time there, becoming entranced by the city\'s beauty. He finally sets off for Kathmandu but falls sick with cholera on the way. His travelling companion, Ram, returns to Kathmandu and tells Muna that her husband has died.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/1/1d/Muna_Madan_-_book_cover.jpg'
  ),

  Book(
      rating: '⭐⭐⭐⭐⭐',
      title: 'Karnali Blues',
      genres: 'Fiction',
      detail: 'Karnali Blues (Nepali: कर्नाली ब्लुज) is book written by Buddhi Sagar and published by FinePrint publication, Nepal in 2010. Karnali Blues is a story about a young boy who travels through different phases of his life with his parents. The story\'s main focus is on the protagonist\'s father.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/8/86/Karnali_Blues_by_Buddhisagar.jpg'
  ),

  Book(
      rating: '⭐⭐⭐⭐⭐',
      title: 'Seto Dharti',
      genres: 'Fiction',
      detail: 'The story is based on the life of a girl named Tara. She is a simple girl living in her village spending her time playing with other children of same village. While the story goes on, she gets married at the age of seven, the very age at which she does not even understand the meaning of marriage. The story in the novel is of the time period 1850-1950, when child marriage used to be very common in Nepalese society.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/4/47/Seto_Dharti_by_Amar_Neupane.jpg'
  )

];