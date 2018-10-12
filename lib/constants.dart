import 'dart:collection';

final LinkedHashMap questionSortTypes = LinkedHashMap.from({
  "activity" : "Active",
  "votes" : "Votes",
  "creation" : "Newest",
  "hot" : "Hot Today",
  "week" : "Hot Weekly",
  "month" : "Hot Monthly",
});

const int DEF_PAGE_SIZE = 30;