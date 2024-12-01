# Flutter Weather App - Clean Architecture with Bloc

A scalable weather application built with Flutter, following Clean Architecture principles and using Bloc for state management. Users can enter a city name to fetch real-time weather details like temperature, description, and an icon using the OpenWeatherMap API. The app emphasizes separation of concerns, robust error handling, and a clean, maintainable codebase.

---

## Features

### User Input
- Text field for entering the city name to search for weather data.

### Weather API Integration
- Uses **OpenWeatherMap API** to fetch real-time weather data.
- API requests are handled using **Http** for network communication.

### State Management with Bloc
- Implements **Bloc** (Business Logic Component) for managing state transitions.
- Separates UI (Presentation Layer) from Business Logic for better maintainability.

### Data Parsing and Display
- Parses the API response to extract temperature, weather description, and weather icon.

### Error Handling
- Detects and displays errors for invalid city names (`City not found`).
- Handles network errors (`Network error, please try again`).
- Provides clear and actionable error messages for the user.
