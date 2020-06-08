# Destiny Crucible Tracker
## Created by Gavin Uhran
### Please Note
This project has not been updated for the any version of Bungie's rest API leading up to and following the release of Destiny 2 in September, 2017

### Description
This program displays the K/D statistic of my account in the video game 'Destiny' made by Bungie. This was done by implementing **Alamofire**, allowing me to access Bungie's **rest API** through **Xcode**.

### How it Works
First, the program imports the **JSON** data for each of my three characters from Bungie's **rest API**. Since Bungie's API requires a private API access key, provided via application, I used HTTP networking library **Alamofire** to string my API key with the GET requests. 

I parsed through the data for each character to find each kills to deaths ratio (KD), a statistic showing a character's efficiency in the game. I then used conditionals to determine if the KD was a poor, decent, or impressive, each outcome displaying a different image to indicate to how good each of my characters performs. 

### Future Improvements
Since Bungie's API was completely revamped in preparation for Destiny 2 in Fall 2017, there is no further work to do on this project. Moving forward, I may look to create a new version of the app for Destiny 2, hopefully adding analysis on more statistics. That would take place in a separate repository, and I will note here if that project takes place.