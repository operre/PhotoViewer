# PhotoViewer

#### About the project
This project is a photo viewer that contains two screens: the first one has a list of photos and the second one has details of a selected photo, like title and description. The information is provided by the Flickr API in two different endpoints: `flickr.photos.search` and `flickr.photos.getInfo`. The search endpoint requires a search text that was set as `“Food recipes”`. Also, Cocoapods is being used to handle dependencies. The only dependency is the Kingfisher framework that load images, cache them and also provide placeholder logic. The chosen architecture was VIPER since is clean, decoupled and has a great testability. There are some unit tests and the current code coverage is 54,5%.

#### In case of have more time to work in this project, the main improvements would be: 
-  Create an empty state view to use when there are no photos to show;
- Add a search bar so users can make their own searches instead of just have food recipes photos;
- Add pagination with infinity scroll;
- Write more tests to improve code coverage.

#### Instructions
To run the project, open `PhotoViewer.xcworkspace`, select an iPhone device from the device list and run the app.
