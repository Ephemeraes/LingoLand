# Bad Words API - README

## Overview

This project is a Spring Boot application that provides a RESTful API for managing and detecting bad words in text. It allows users to add, remove, and check bad words in a text. The API reads from and writes to a JSON file that stores the list of bad words.

## Features

1. Retrieve Bad Words List: Fetches a list of all bad words stored in the system.
2. Add Bad Words: Adds new bad words to the system's list.
3. Delete Bad Words: Removes specified bad words from the system's list.
4. Check for Bad Words: Checks if a given string contains any bad words.
5. Count Bad Words: Counts how many bad words are present in the given input.
6. Remove or Replace Bad Words: Replaces bad words with asterisks or removes them from the input string.

## Prerequisites

- Java 17 or higher
- Maven for dependency management and building the project

## Project Structure

```
badwords-api
├── src
│   └── main
│       ├── java
│       │   └── com.example.badwords
│       │       ├── BadwordsApiApplication.java  // Main class to start the application
│       │       └── controller
│       │           └── BadwordsController.java  // RESTful API controller for bad words management
│       └── resources
│           └── badwords
│               └── words.json  // JSON file to store bad words list
└── pom.xml  // Maven configuration file
```

## API Endpoints

### 1. Get List of Bad Words

URL: `/api/badwords/list`

Method: `GET`

Description: Retrieves the list of all bad words stored in the system.

Response:
```json
{
    "badWords": ["badword1", "badword2", "badword3"]
}
```

### 2. Add New Bad Words

URL: `/api/badwords/edit`

Method: `POST`

Description: Adds new bad words to the system's list.

Request Body:
```json
{
    "words": "word1 word2 word3"
}
```

Response:
```json
{
    "message": "Bad words updated successfully"
}
```

### 3. Delete Bad Words

URL: `/api/badwords/delete`

Method: `DELETE`

Description: Removes specified bad words from the system's list.

Request Body:
```json
{
    "words": "word1 word2"
}
```

Response:
```json
{
    "message": "Bad words deleted successfully"
}
```

### 4. Check for Bad Words in Input

URL: `/api/badwords/check`

Method: `POST`

Description: Checks if the input string contains any bad words.

Request Body:
```json
{
    "input": "This is a bad sentence with word1 and word2."
}
```

Response:
```json
{
    "containsBadWord": true
}
```

### 5. Count Bad Words in Input

URL: `/api/badwords/count`

Method: `POST`

Description: Counts how many bad words are present in the input string.

Request Body:
```json
{
    "input": "This sentence contains word1 and word2."
}
```

Response:
```json
{
    "badWordCount": 2
}
```

### 6. Remove or Replace Bad Words

URL: `/api/badwords/remove`

Method: `POST`

Description: Replaces or removes bad words from the input string.

Request Body:
```json
{
    "input": "This sentence contains word1 and word2."
}
```

Response:
```json
{
    "modifiedInput": "This sentence contains ***** and *****."
}
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-repo/badwords-api.git
cd badwords-api
```

### 2. Build the Project

Ensure that Maven is installed on your system.

```bash
mvn clean install
```

### 3. Run the Application

To start the Spring Boot application, run:

```bash
mvn spring-boot:run
```

The application will start on the default port `8080`. You can access the API at `http://localhost:8080/api/badwords`.

### 4. Running Tests

To run the test cases, use the following Maven command:

```bash
mvn test
```

## Customisation

The list of bad words is stored in the `src/main/resources/badwords/words.json` file. You can update this file to add or remove bad words directly.

## Example `words.json` File

```json
{
    "bad": [
        "badword1",
        "badword2",
        "badword3"
    ]
}
```

## Dependencies

The project uses the following dependencies:

- Spring Boot Starter Web: For building the REST API.
- OkHttp: For making HTTP requests (in case you want to extend this with external services).
- json-simple: For handling JSON data.
- JUnit 5: For writing unit tests.
- AssertJ: For fluent assertions in tests.

All dependencies are defined in the `pom.xml` file.

