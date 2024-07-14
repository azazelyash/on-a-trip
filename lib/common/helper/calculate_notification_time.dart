class CalculateNotificationTime {
  CalculateNotificationTime._();

  static String timeAgo(DateTime dateTime) {
    Duration diff = DateTime.now().difference(dateTime);

    if (diff.inMinutes < 1) {
      return "just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} mins ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else if (diff.inDays < 30) {
      return "${diff.inDays} days ago";
    } else if (diff.inDays < 365) {
      int months = (diff.inDays / 30).floor();
      return "$months months ago";
    } else {
      int years = (diff.inDays / 365).floor();
      return "$years years ago";
    }
  }
}
