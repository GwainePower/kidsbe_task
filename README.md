# kidsbe_task

A news-viewing project, using Times Newswire API.
New articles fetching periodically, via streaming REST API calls.
You can filter articles by sections, provided by API.
Also, you can search concrete articles, cached in application.

## Stack

Dio is used to fetch API data;
SQfLite is used to store cached articles;
Shared Preferences is used to store cached sections data;
Web pages diplay via webview_flutter package;
RiverPod is used as state manager.

