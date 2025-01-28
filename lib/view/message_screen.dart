import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controller/message_provider.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessageProvider(),
      child: const MessageView(),
    );
  }
}

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffECEFFF),
        title: const Text(
          "Welcome",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        ),
        actions: [
          Row(
            children: [
              Icon(
                PhosphorIcons.user_switch,
                size: 30,
              ),
              const SizedBox(width: 20),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcXmPNYZ-XDmbuO5gzHPM-sq33yAn0EFQepA&s",
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildToggleButtons(context),
                  const SizedBox(height: 16),
                  Consumer<MessageProvider>(
                    builder: (context, provider, _) {
                      return provider.isChat
                          ? _buildChatList(provider)
                          : _buildNotificationList(provider);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons(BuildContext context) {
    return Consumer<MessageProvider>(builder: (context, provider, _) {
      return Row(
        children: [
          _buildToggleButton(
            context: context,
            title: 'Chat',
            isSelected: provider.isChat,
            onTap: () {
              if (!provider.isChat) provider.toggleView();
            },
            isPressed: provider.isChat,
          ),
          const SizedBox(width: 10),
          _buildToggleButton(
            context: context,
            title: 'Notification',
            isSelected: !provider.isChat,
            onTap: () {
              if (provider.isChat) provider.toggleView();
            },
            isPressed: !provider.isChat,
          ),
        ],
      );
    });
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isPressed,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 172,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isPressed ? const Color(0xFF5E4B8B) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isPressed ? null : Border.all(color: const Color(0xFF5E4B8B)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isPressed ? Colors.white : const Color(0xFF5E4B8B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatList(MessageProvider provider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.messages.length,
      itemBuilder: (context, index) {
        final message = provider.messages[index];
        return Container(
          width: 361,
          height: 59,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(message.imageUrl ?? ''),
              ),
              const SizedBox(width: 12),
              Text(
                message.userName,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(PhosphorIcons.chats_teardrop),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationList(MessageProvider provider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.notifications.length,
      itemBuilder: (context, index) {
        final post = provider.notifications[index];
        bool isExpanded = post['isExpanded'];

        return Container(
          width: 361,
          padding: const EdgeInsets.only(top: 10),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      post['post'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isExpanded
                            ? PhosphorIcons.caret_up
                            : PhosphorIcons.caret_down,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        provider.toggleNotificationExpand(index);
                      },
                    ),
                  ],
                ),
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                ...List.generate(
                  (post['items'] as List).length,
                  (itemIndex) {
                    final item = post['items'][itemIndex];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(item['imageUrl'] ?? ''),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(item['message']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
