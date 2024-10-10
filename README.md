# LingoLand

This project includes a front-end application and a Java Maven back-end service, designed to provide language learners with an interactive and personalized learning experience.

## Project Status

🚧 Note: This project is currently under development. 🚧

- **Front-end Development**: Ongoing, some features may not be fully implemented yet.
- **Back-end Service**: The backend code is located in the `LingoLand_BackEnd` folder, responsible for data management and API provision.

## Project Structure

### Front-end

LingoLand/
│
├── README.md # Project documentation
│
├── LingoLand/ # Front-end project folder
│ ├── assets/ # Static resources, such as images and fonts
│ ├── src/ # Application source code
│ │ ├── components/ # Reusable React components
│ │ └── pages/ # Various pages/interfaces of the application
│ ├── ios/ # iOS specific code and configuration
│ ├── app.json # Expo configuration file
│ ├── babel.config.js # Babel compiler configuration
│ ├── metro.config.js # Metro packaging tool configuration
│ ├── index.js # Application entry file
│ ├── package.json # Project dependencies and scripts
│ └── yarn.lock # Dependency version lock file
│
└── LingoLand_BackEnd/ # Backend project folder
├── badword_chatbot/ # ChatBot module for filtering bad words
├── LingoLandVersion/ # Backend version implementation
├── src/ # Back-end Java source code
├── target/ # Maven build output
├── pom.xml # Maven project configuration file
└── database/ # Database setup scripts

### Frontend Overview

The front-end is built with React Native and Expo in order to achieve a cross-platform user experience for iOS and Android users.

1.	Components: Reusable components, such as buttons, titles, and input boxes.
2.	Pages: Various pages of the app, such as HomeScreen, LoginScreen, ProfileScreen, and WordSpellScreen.
3.	Expo: Testing and deploying mobile applications.

Note: For all fetch and get requests in the front-end interfaces, please change the default server address to your own IP address.

### Backend Overview

The backend is built with Java and Maven in order to provide an API interface for interaction with the front end, and includes the following features:

1.	User authentication: Secure login and registration.
2.	Data management: User data processing, progress tracking and content management.
3.	ChatBot: A chat module that provides further learning support.
4.	Database: Contains SQL scripts for setting up the database.

### Function

1.	Interactive learning: Daily tasks, grammar exercises, word spelling and quizzes, etc.
2.	Progress tracking: Users are able to view and track their learning progress and achievements.
3.	ChatBot support: Provide assistance and ensure the security of the conversation content.
4.	Personal data management: Allows users to update personal settings and information.
5.	Cross-platform support: Utilise Expo to run on both iOS and Android.

## Installation and Setup

### Prerequisite

1.	Node.js and npm are used to run the front-end.
2.	Java JDK (17 and above) and Maven are used for the backend. 
3.	Expo Go application: Designed to test the front-end on mobile devices.

### Frontend Settings

1.	Clone repository:
git clone <repository_url>
cd LingoLand
2.	Install dependencies:
npm install
3.	Run the application: Open Expo Developer Tools
npm start
4.	Mobile terminal test:
Open the Expo Go app and scan the QR code in the developer tools/Expo Go

### Backend Settings

1.	Enter the backend directory:
cd LingoLand_BackEnd
2.	Build project:
mvn clean install
3.	Running backend services:
mvn spring-boot:run
4.	Database settings:
Run the SQL script in the database folder to create the necessary tables.
5. Link your database
Change the settings of sql in pom.xml to your local database

### Run the Complete Application

1.	Ensure that both the front-end and back-end services have been started.
2.	The baseUrl in the new front-end configuration matches the address of the backend server.

## Usage Method

1.	Registration/Login: Create a new account or log in with an existing account.
2.	Learning: Engage in learning modules such as word spelling, daily tasks, and grammar exercises.
3.	Progress tracking: View your learning progress and achievements on your profile page.
4.	ChatBot: Get further personalised learning help and guidance.
5.	Personal information management: Update user personal settings and information.

## Team Members

1.  Yue Yang
2.  Haitao Zhao
3.  Langdi Li
4.  Xianglong Lin
5.  Jiaqi Zhang
6.  Yiqing Sheng

For any questions, suggestions, or issues, please contact the team.
