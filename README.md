# SpaceX Rockets App

This Flutter app displays a list of SpaceX rockets with their details fetched from the SpaceX API.

## Features

- Displays a list of rockets with details such as name, country, and engines count.
- Fetches rocket data from the SpaceX API.
- Shows a reload button when the network connection is not available.
- Responsive design for phone screens.

## Code Structure

The project structure is organized as follows:

- `lib/`: Contains all the Dart code for the app.
  - `providers/`: Contains classes for state management using the Provider package.
    - `rocket_provider.dart`: Manages the state for fetching and storing rocket data.
  - `screens/`: Contains screen widgets for the app.
    - `home_screen.dart`: Displays the list of rockets.
  - `models/`: Contains model classes for representing rocket data.
  - `widgets/`: Contains reusable UI components.
  - `main.dart`: Entry point of the app.

## Screenshots
<img src="WhatsApp%20Image%202024-06-03%20at%2013.22.51.jpeg" alt="Rocket List Screen" height="400">

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/spacex-rockets-app.git
