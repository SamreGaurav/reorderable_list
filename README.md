
Stock Watchlist: Reorderable List with Clean Architecture
Hey there! This project is a focused example of how to build a professional-grade Stock Watchlist in Flutter. The main goal was to implement a smooth, draggable list where users can reorder their stocks, all while keeping the code "clean" and scalable.

🧠 The "Why" Behind My Approach
When building this, I didn't just want a list that worked; I wanted a project that wouldn't break as it grew. Here’s how I tackled it:

🛡 Clean Architecture
I split the app into three distinct layers. If we ever decided to swap the local mock data for a real API or a Firebase backend, we would only have to change the Data layer. The Domain (the "brain" of the app) wouldn't even notice the difference.

🔄 The Reordering Logic
Reordering in Flutter can be a bit "jumpy" if not handled correctly. In the WatchlistBloc, I implemented a specific index-adjustment logic.

The Challenge: When you drag an item down, Flutter reports a newIndex that assumes the item is still in its old spot. To fix the "off-by-one" error, I added a check:

Dart
if (oldIndex < newIndex) {
newIndex -= 1;
}
This ensures that when you let go of a stock, it stays exactly where you dropped it.

⚡ State Management
I used BLoC because it’s predictable. Whether the app is loading, showing an error, or updating a list order, the UI simply "reacts" to the state. No messy setState calls scattered everywhere.

🏗 How It's Organized
I followed a feature-first folder structure. It makes it much easier to find everything related to the Watchlist in one place:

Domain Layer: Where the StockEntity and UseCase live. This is pure Dart—no Flutter dependencies here.

Data Layer: This handles the "how" of getting data. Currently, it uses a WatchListRepositoryImp with a simulated delay to mimic a real network call.

Presentation Layer: This is the Flutter side. It contains the WatchlistBloc and the WatchlistView.

🛠 Tech Stack I Used
flutter_bloc: For keeping the UI and Logic separate.

get_it: My go-to for Dependency Injection. It keeps the constructors clean.

dartz: Used the Either type for functional error handling (Left for Failure, Right for Success).

ReorderableListView: For that native drag-and-drop feel.

🚀 Getting Started
Get the packages: Run flutter pub get.

The DI Step: I used a service locator (sl). Make sure init() is called in your main.dart so all the dependencies are registered.

Run it: * On Emulator: Just long-press and drag!

On Chrome: I've optimized the BLoC to handle web indices, but remember that web dragging feels best with a mouse-drag gesture.

📝 Final Thoughts
The most interesting part of this task was balancing the UI's need for a quick "snap" during reordering with the BLoC's asynchronous nature. By updating the list locally in the BLoC state, the UI feels snappy and responsive.