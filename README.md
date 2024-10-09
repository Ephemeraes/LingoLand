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
├── assets/                  # Contains static resources such as images and fonts
│
├── src/                     # Application source code
│   ├── components/          # Reusable React components
│   └── pages/               # Various pages of the application
│
├── ios/                     # iOS-specific code and project configurations
│
├── app.json                 # Expo configuration file
├── babel.config.js          # Babel compiler configuration
├── metro.config.js          # Metro bundler configuration
├── index.js                 # Application entry point
├── package.json             # Project dependencies and scripts
└── yarn.lock                # Dependency version lock file

### Back-end (`LingoLand_BackEnd`)

- **`/src`**: Contains source code and resources.
- **`/target`**: Includes Maven build outputs.
- **`pom.xml`**: Maven project configuration file.
- **`database`**: Contains database-related scripts.

## Installation and Running Instructions

### Front-end Application

To set up and run the front-end application, please follow these steps:

1. **Environment Setup**: Ensure your development environment has Node.js and npm installed. Visual Studio Code is recommended as the development environment.
2. **Acquire Project Files**:
   - If the project files have been directly provided to you via USB, network drive, or other means, ensure they are saved on your local system.
3. **Enter Project Directory**:
   ```bash
   cd ./LingoLand
4. **Install Dependencies**：
   ```bash
   npm install
5. **Start the Application**：
   ```bash
   npm start
   - 此命令将启动一个开发服务器，并打开一个新的浏览器窗口或标签页显示 Expo 开发者具。
6. **Preview the Application on Your Phone**：
   - Ensure your phone has the Expo Go app installed (available from the App Store or Google Play).
   - Use the Expo Go app to scan the QR code displayed on the Developer Tools page.
   - Ensure your phone and the computer running the development server are on the same network.

## Contact Information

**Project Lead**: [Langdi Li] - [langdi.li@uqconnect.edu.au]

Please contact the project lead with any questions or suggestions regarding the project.