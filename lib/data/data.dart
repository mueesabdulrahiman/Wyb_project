import 'package:wyb_project/model/story.dart';
import 'package:wyb_project/model/user.dart';

// lists of user data

final List<User> users = [
  User(
      name: 'Sheela',
      imgUrl:
          'https://img.freepik.com/free-photo/portrait-smiling-young-businesswoman-standing-with-her-arm-crossed-against-gray-wall_23-2147943827.jpg',
      stories: stories),
  User(
      name: 'Abdul',
      imgUrl:
          'https://img.freepik.com/free-photo/portrait-handsome-young-man-with-arms-crossed-holding-white-headphone-around-his-neck_23-2148096439.jpg',
      stories: stories2),
  User(
      name: 'Sona',
      imgUrl:
          'https://img.freepik.com/free-photo/pleased-young-pretty-caucasian-girl-standing-with-closed-posture-profile-view-isolated-white-background-with-copy-space_141793-90509.jpg',
      stories: stories3),
  User(
      name: 'Kale',
      imgUrl:
          'https://img.freepik.com/free-photo/young-beautiful-woman-pouting-against_23-2148204711.jpg?t=st=1726502477~exp=1726506077~hmac=435fbb0f5a991164cb68d19db8be3bfe70532e398db5a8efed7b48007c9ad9e7&w=360',
      stories: stories4),
  User(
      name: 'John',
      imgUrl:
          'https://img.freepik.com/premium-photo/confident-young-man-plaid-shirt-outdoors_1221142-2060.jpg?w=360',
      stories: stories5),
  User(
      name: 'Aarom',
      imgUrl:
          'https://img.freepik.com/free-photo/handsome-man-with-glasses_144627-18659.jpg?t=st=1726502594~exp=1726506194~hmac=72d8586aa3a770c0bc26e565593363d337c2ee16de0a5294de9ef58c8cfc0659&w=360',
      stories: stories6)
];


// lists of story data

final stories = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3485439793/preview/stock-footage-vertical-video-of-a-tired-and-bored-brunette-girl-in-a-checkered-shirt-lies-on-the-sofa-leaning-on.webm',
      date: '30m'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3531303305/preview/stock-footage-vertical-video-barracudas-swim-in-blue-water-on-sunny-day-slow-motion-close-up-of-lot-of-yellow.webm',
      date: '1h'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3519790013/preview/stock-footage-nutria-in-free-nature-eating-food.webm',
      date: '4h')
];

final stories2 = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3458886643/preview/stock-footage-vertical-video-close-up-of-young-guy-opening-his-eyes-and-looking-at-the-camera-with-smile.webm',
      date: 'Just now'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3545335957/preview/stock-footage-vertical-video-of-london-vertical-aerial-view-shot.webm',
      date: '15m')
];

final stories3 = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3447330173/preview/stock-footage-when-it-rains-heavily-water-pours-out-of-over-gutters-vertical-video.webm',
      date: '45m'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3453747717/preview/stock-footage-vertical-screen-diverse-team-of-multiethnic-young-scientists-passing-internship-in-a-modern-high.webm',
      date: '1h'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3503331799/preview/stock-footage-pov-vertical-shot-of-happy-african-american-family-sitting-together-at-dinner-table-smiling-and.webm',
      date: '20h')
];

final stories4 = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3456528807/preview/stock-footage-a-small-brook-surrounded-by-various-plants-slow-motion-vertical-video-panning.webm',
      date: '15m'),
];

final stories5 = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3462642789/preview/stock-footage-sunrise-sea-view-from-shoreline-beach-pebbles-sea-beach-shore-with-waves-vertical-video-pebble.webm',
      date: '2h'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3513176797/preview/stock-footage-sunflowers-in-the-field-in-ukraine-vertical-video.webm',
      date: '10h'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3456928697/preview/stock-footage-the-reflection-of-sunlight-on-the-surface-of-the-lake-at-dusk-at-sunset-the-sun-s-rays-twinkle-on.webm',
      date: '23h')
];

final stories6 = [
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3506229807/preview/stock-footage-pov-vertical-shot-of-young-cheerful-multiethnic-friends-smiling-and-waving-at-camera-while-taking.webm',
      date: '20m'),
  Story(
      mediaType: MediaType.video,
      url:
          'https://www.shutterstock.com/shutterstock/videos/3478546755/preview/stock-footage-beautiful-summer-sun-between-green-leaves-nature-background-close-up-vertical-video.webm',
      date: '1h'),
];
