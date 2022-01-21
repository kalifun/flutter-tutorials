import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_ui/tik_tok_icons_icons.dart';

// 操作工具部分
class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;
  const ActionsToolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getFollowAction(),
        _getSocialAction(title: "3.2m", icon: TikTokIcons.heart),
        _getSocialAction(title: '16.4k', icon: TikTokIcons.chat_bubble),
        _getSocialAction(
            title: 'Share', icon: TikTokIcons.reply, isShare: true),
        _getMusicPlayerAction()
      ]),
    );
  }

  Widget _getSocialAction(
      {required String title, required IconData icon, bool isShare = false}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 60,
      height: 60,
      child: Column(
        children: [
          Icon(
            icon,
            size: isShare ? 25.0 : 35.0,
            color: Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: isShare ? 5.0 : 2.0,
            ),
            child: Text(
              title,
              style: TextStyle(fontSize: isShare ? 10.0 : 12.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _getFollowAction() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 60,
      height: 60,
      child: Stack(
        children: [_getProfilePicture(), _getPlusIcon()],
      ),
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
        width: PlusIconSize,
        height: PlusIconSize,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 43, 84),
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
      left: ((ActionWidgetSize / 2) - (ProfileImageSize / 2)),
      child: Container(
        padding: EdgeInsets.all(1),
        height: ProfileImageSize,
        width: ProfileImageSize,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
        child: CachedNetworkImage(
          imageUrl:
              "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  LinearGradient get musicGradient => const LinearGradient(colors: [
        Color.fromRGBO(66, 66, 66, 1),
        Color.fromRGBO(33, 33, 33, 1),
        Color.fromRGBO(33, 33, 33, 1),
        Color.fromRGBO(66, 66, 66, 1),
        // Colors.grey[800],
        // Colors.grey[900],
        // Colors.grey[900],
        // Colors.grey[800]
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(11),
              height: ProfileImageSize,
              width: ProfileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
              child: CachedNetworkImage(
                  imageUrl:
                      "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error)),
            ),
          ],
        ));
  }
}
