class AppwriteData {
  static const mainDbId = '64dac551c1bc6db3e94c';
  static const endpoint = 'https://cloud.appwrite.io/v1';
  static const projectId = '64d6cf1700a92e8bd293';
  static const threadDbCollectionId = 'threads';
  static const threadRealtimeChannel =
      'databases.$mainDbId.collections.$threadDbCollectionId.documents';
  static const usersDbCollectionId = 'users';
  static const forumSettingsDbCollectionId = 'forumSettings';

  static const funcIdCreateUser = 'createUser';
  static const funcIdRemoveUser = 'removeUser';
  static const funcIdDeleteUserAccount = 'deleteUserAccount';
  static const funcIddeleteThreadAutomatically = 'deleteThreadAutomatically';
}

class OfficialSite {
  static const host = 'forumbook-f883e.web.app';
  static const privacy = 'about/privacy';
  static const terms = 'about/terms';
}

