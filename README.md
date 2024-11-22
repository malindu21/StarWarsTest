# StarWarsTest

Sample Screenshots: 
![Simulator Screenshot - iPhone 15 Pro - 2024-11-22 at 16 19 38](https://github.com/user-attachments/assets/70190f06-62d1-4531-90c8-e6755343c6bd | width=100)
![Simulator Screenshot - iPhone 15 Pro - 2024-11-22 at 16 19 34](https://github.com/user-attachments/assets/03ef05e4-fe7f-4d1a-978e-48cac0d7c00a | width=100)

# IOS Developer Test

## Project Documentation

### 1. Project Setup Instructions

To get started with this project, follow the steps below to clone, install dependencies, and run the project.

#### Clone the Repository

Clone the repository to your local machine:

git clone https://github.com/malindu21/StarWarsTest.git

Navigate to the project directory:

cd StarWarsTest

#### Install Dependencies

This project uses **Swift Package Manager (SPM)** to manage dependencies.

1. Open the `.xcodeproj` or `.xcworkspace` file in **Xcode**.
2. Xcode will automatically resolve the dependencies defined in the `Package.swift` file. If it doesn't resolve automatically:
   - Go to **File** > **Swift Packages** > **Update to Latest Package Versions**.

#### Run the Project

1. Open the `.xcodeworkspace` (if applicable) or `.xcodeproj` file in Xcode.
2. Select the target device or simulator.
3. Click on the **Run** button (or press `Cmd + R`) in Xcode to build and run the project.

---

### 2. Libraries Used

1. **Combine**
   - **Why:** Used for handling asynchronous data streams and simplifying state management. It fits the reactive programming model, particularly useful for our ViewModel-driven architecture, where UI updates respond to data changes seamlessly.

2. **SwiftUI**
   - **Why:** A declarative framework used for building UIs. It allows rapid UI design, reducing boilerplate code and providing reactive data binding with `@State`, `@Binding`, and `@Published` properties.

3. **KingFisher**
   - **Why:** Used for image caching and asynchronous image downloading. Kingfisher simplifies working with remote images by handling caching, memory management, and downloading images asynchronously, ensuring smooth UI performance when displaying images in the app.

---

### 3. Architecture Overview

#### MVVM (Model-View-ViewModel)

The project follows the **MVVM** (Model-View-ViewModel) design pattern.

- **Model:** The data layer (e.g., `Planet` model and `PlanetsResponse`) which contains the business logic and the structure of the data.
- **View:** The UI layer, represented by SwiftUI Views, which binds to the ViewModel to display data and react to state changes.
- **ViewModel:** Handles the presentation logic. It fetches data, processes it, and prepares it for display. It communicates with the model layer and updates the view through bindings.

#### Why MVVM?

MVVM allows for clear separation between UI and business logic, making the codebase easier to maintain and test. Data-binding in SwiftUI works seamlessly with the `@Published` property wrapper to automatically update the view when the ViewModel's data changes.

---

### 4. Known Issues

- **Network Requests:** Some network requests might occasionally fail if the device’s network connection is unstable. Error handling needs to be further refined to ensure a smoother user experience.

---

### 5. Testing

Testing has been implemented using unit tests and mock data to ensure the reliability of core features.

#### Unit Tests:

- **ViewModel Tests:** Ensures that the `PlanetsViewModel` correctly processes the network response and handles different states (loading, success, and failure).
- **Mock Networking:** Uses the `Mockingjay` library to simulate network requests in the tests, so no real API calls are made during testing.

#### Integration Tests:

- **UI Tests:** Checks basic UI flows, ensuring buttons, labels, and lists function as expected when interacting with the app.

To run the tests:

1. Open the project in Xcode.
2. Select the test target.
3. Press `Cmd + U` to run the tests.

---

### 6. Optional Features

1. **Pagination**

   - **Implementation:** Pagination is supported for loading planets in batches. When the user scrolls to the end of the list, additional data is fetched using the `loadNextPage()` function to be implemented. This helps in handling large datasets efficiently by loading them in chunks currently there are few objects on response.

---

### License

Include your preferred license here. For example, you could add:

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
