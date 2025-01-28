import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageProvider with ChangeNotifier {
  bool _isChat = true;

  List<Message> _messages = [
    Message(
      userName: 'Vijay Kumar',
      imageUrl:
          'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
    ),
    Message(
        userName: 'Vijay Kumar',
        imageUrl:
            'https://media.istockphoto.com/id/1427894275/photo/portrait-of-bearded-man-in-cap-posing-in-profile-outdoors-profile-view-of-bearded-young-man.jpg?s=612x612&w=0&k=20&c=nDvqZgDtIp7QvfmqNenbcH__jdnYTGUbpXvy7ViYhe0='),
    Message(
        userName: 'Vijay Kumar',
        imageUrl:
            'https://media.istockphoto.com/id/1338289824/photo/close-up-image-of-indian-man-with-buzz-cut-hairstyle-to-disguise-receding-hairline-wearing-t.jpg?s=612x612&w=0&k=20&c=YGf5cEYxFFnl3_ZaP0kwbJqTFk9IIOymvtQUgXHstTg='),
  ];

  // Updated notifications list with 'isExpanded' for each notification
  List<Map<String, dynamic>> _notifications = [
    {
      'post': 'Post 01',
      'items': [
        {
          'message': 'Hari has shared a review for your work.',
          'imageUrl':
              'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
        },
        {
          'message': 'Hari has appointed you.',
          'imageUrl':
              'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
        },
      ],
      'isExpanded': false,
    },
    {
      'post': 'Post 02',
      'items': [
        {
          'message': 'Siva has declined your job request.',
          'imageUrl':
              'https://media.istockphoto.com/id/1303206558/photo/headshot-portrait-of-smiling-businessman-talk-on-video-call.webp?a=1&b=1&s=612x612&w=0&k=20&c=8lmFJ68jo0AB02jBDHswcJjuh_YhQMKEC7nTrtgQ58I=',
        },
      ],
      'isExpanded': false,
    },
  ];

  bool get isChat => _isChat;

  List<Message> get messages => _messages;

  List<Map<String, dynamic>> get notifications => _notifications;

  void toggleView() {
    _isChat = !_isChat;
    notifyListeners();
  }

  // Toggle the expansion of a specific notification
  void toggleNotificationExpand(int index) {
    _notifications[index]['isExpanded'] = !_notifications[index]['isExpanded'];
    notifyListeners(); // Notify listeners to rebuild the widget
  }
}
