# SwiftUIExamData

## Description
"SwiftUIExamData" is a SwiftUI application that demonstrates data handling, persistence, and consumption of external APIs. The app showcases a seamless user experience where data from an API is displayed, and users can also create and manage their own data. It leverages **Alamofire** for API communication and **SwiftData** for data persistence. The project follows the **MVVM architecture** for clean code structure and scalability.

## Features
- **Main Screen**: Displays two buttons:
  - A button that leads to a list of characters fetched from the Marvel Heroes API.
  - A button to manage user-created data with CRUD (Create, Read, Update, Delete) operations.
  
- **API Data Screen**: Displays 12 hero items fetched from the API. Each hero links to a detail view with additional information.
  
- **User-Created Data Screen**: Allows users to create, modify, and delete data. This screen uses **Core Data** (SwiftData) for persistence.

- **User Interface**: Simple, intuitive, and fully responsive in portrait mode.

- **Tests**: Includes 1 unit test and 1 UI test to ensure stability and proper functioning.

## Tools and Technologies
- **SwiftUI**: For building the user interface.
- **Alamofire**: For making network requests to fetch data from the API.
- **SwiftData/CoreData**: For managing and persisting user-created data.
- **MVVM Architecture**: For organizing the code into Model, View, and ViewModel layers.
  
## Video

https://github.com/user-attachments/assets/5b849842-8e7d-4b74-9068-89744b9dbdd5
