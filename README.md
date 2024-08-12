NotiFYI
NotiFYI App Readme: Welcome to NotiFYI, an exclusive Intra-University communication app for Banasthali University, build with Dart and Flutter, leveraging Firebase for backend services. This app serves as a platform for both users (students and faculties) and Admin to communicate efficiently. Features:

Authentication: - Users and Admin can securely sign up and log in to their respective accounts.
Forget Password: - Users and Admin can reset their Passwords.
Post Notices: - Admin can post Notices on the app with respective Event names, Dates.
Prioritise Notice: - Users and Admin can prioritize which notices are important to them.
Search Notices: - Users and Admin can search notices using Event name or Date of Event. Technology Used: • Dart & Flutter: Dart programming language is used for building the application logic, and Flutter framework is utilized for creating a beautiful and responsive user interface across Android and iOS platforms. • Firebase: Firebase is employed for various backend services including authentication, real-time database for chat functionality, and cloud storage for storing user data securely. Setup Instructions:
Clone the Repository: git clone
Install Dependencies: flutter pub get
3.Configure Firebase:
• Create a Firebase project in the Firebase console(https://console.firebase.google.com/) • Add your Android app to the Firebase project and follow the setup instructions to download the google-services.json file and place it in the android/app directory.
• Add your iOS app to the Firebase project and follow the setup instructions to download the GoogleService-Info.plist file and place it in the ios/Runner directory.
Run the App: Steps to Run the Project on Your Device:
Enable Developer Mode:
• On your Android device, go to Settings > About phone.
• Tap on the "Build number" multiple times until you see a message that says, "You are now a developer!"
• Go back to the main Settings menu, and you should now see a new option called "Developer options" or "Developer settings".
• Open "Developer options" and enable USB debugging.
Connect Your Device:
• Use a USB cable to connect your Android device to your computer.
Set Up Device for Debugging:
• When you connect your device to the computer for the first time, you might get a prompt on your device asking for permission to allow USB debugging. Allow it.
Check Device Connection:
• Open a terminal or command prompt.
• Run the following command to check if your device is connected properly: flutter devices
• Your connected device should be listed.
Run the App:
• Navigate to the project directory in your terminal.
• Run the following command to build and install the app on your connected device: flutter run
Testing:
• Once the app is installed on your device, you can open it from the app drawer.
• Test various features such as Authentication, View Notices, Prioritization (Starred), Search, View Categories, and Add Notices (Only for Admin) on your device. That's it! You should now have the NotiFYI app running on your Android device, ready for testing and use. If you encounter any difficulties during the setup process, don't hesitate to reach out for assistance.
