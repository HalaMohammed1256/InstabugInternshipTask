# InstabugInternshipTask

logging framework that has an easy interface to log with different levels and fetch logs when needed.


Requirements
The logging framework should accept a log message and level.
The logging framework should store each log with it's level and timestamp. 
Store logs on disk e.g. CoreData.
The framework should have minimal impact on the main thread; saving/loading should happen on a background thread and main thread should not be blocked.
The limit of storage at disk is 1000; if more than 1000 logs received, you should start deleting the earliest logs.
If log message is longer than 1000 character, truncate at 1000 and add ... at the end
Clean disk store on every app launch. 
Test the framework using unit tests.
