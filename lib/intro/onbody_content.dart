class Onbodycontent{
  String images;
  String title;
  String description;
  Onbodycontent({required this.images,required this.title,required this.description});
}
List <Onbodycontent> content=[
  Onbodycontent(
      images: ("assets/images/beach.png"),
      title: "Let’s\nhave the\nbest\nvacation\nwith us",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua."
  ),
  Onbodycontent(
      images: ("assets/images/insideplane.png"),
      title: "Travel\nmade easy\nin your\nhands",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua."
  ),
  Onbodycontent(
      images: ("assets/images/mountainview.png"),
      title: "Let’s\ndiscover\nthe world\nwith us",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua."
  ),
];
