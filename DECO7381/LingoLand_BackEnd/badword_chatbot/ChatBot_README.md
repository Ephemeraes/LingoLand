# ChatGPT API integrated with Spring Boot

## Overview

This project shows how to easily integrate OpenAI's ChatGPT API with Spring Boot. The app allows users to send messages to ChatGPT and get responses based on the conversation history. Conversations are managed by topic, and users can continue existing conversations or start new ones.

### Main function

1. REST API: Provide an API endpoint (' /api/chatgpt/send ') to interact with OpenAI's ChatGPT.
2. Dialogue Management: Maintain the dialogue history through 'topicId' and support the opening of new dialogues.
3. OkHttp Integration: Communicate with OpenAI's API through OkHttp.
4. JUnit Tests: Contains JUnit 5-based API unit tests.

### 1. ChatGPT API integration

This project allows users to interact with OpenAI's ChatGPT API. By tracking conversations with 'topicId', users can continue existing conversations or start new ones by setting the 'newTopic' flag.

#### Sample request

{
"What is the capital of France?" ,
"topicId": "general-knowledge",
"newTopic": "false"
}

#### Sample response

{
"status": "success",
response: "The capital of France is Paris."
}

### 2. Dialogue management

Each conversation is identified by a unique topicId. If newTopic is set to true, the conversation history under that topic will be cleared and restarted. Otherwise, the existing dialogue will continue.

#### Example

{
message: "Explain the difference between affect and effect." ,
"topicId": "grammar-help",
"newTopic": "false"
}

This allows you to continuously get contextual responses on specific topics.

### 3. OkHttp integration

The application communicates with OpenAI's ChatGPT API through the OkHttp library, building an HTTP POST request with a conversation history and sending it to the API.

#### Example

okhttp3.RequestBody body = okhttp3.RequestBody.create(
json.toString(), okhttp3.MediaType.parse("application/json;  charset=utf-8"));

okhttp3.Request request = new okhttp3.Request.Builder()
.url(API_URL)
.header("Authorization", "Bearer " + apiKey)
.post(body)
.build();

### 4. JUnit test

The project uses JUnit 5 for unit testing to ensure that the /send endpoint works, to test sending messages to the API and to verify responses.

#### Example

@Test
public void testSendMessage() {
HttpHeaders headers = new HttpHeaders();
headers.add("Content-Type", "application/json");

String requestBody = "{\"message\": \"Hello, ChatGPT! \", \"topicId\": \"test\", \"newTopic\": \"true\"}";
HttpEntity<String> request = new HttpEntity<>(requestBody, headers);

ResponseEntity<String> response = restTemplate.exchange(
"/api/chatgpt/send", HttpMethod.POST, request, String.class);

assertEquals(HttpStatus.OK, response.getStatusCode());
System.out.println("API Response: " + response.getBody());
}

This test ensures that the /send API works as expected and returns the correct response.

### 5. Project structure

•	src/main/Java/com/example/controller/ChatGPTController. Java: processing ChatGPT controller API request.
•	src/main/resources/ : indicates the directory for storing application configuration files.
•	src/main/Java/com/example/ChatGptApiApplication. Java: Spring Boot application's main class.
•	src/test/Java/com/example/chatbotapi/ChatGPTApiTest Java: used for API test unit test class.

### 6. Dependencies

The project uses the following dependencies:

#### 1. Spring Boot Starter Web

<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-web</artifactId>
</dependency>

#### 2. OkHttp Indicates the HTTP client

<dependency>
<groupId>com.squareup.okhttp3</groupId>
<artifactId>okhttp</artifactId>
The < version > 4.9.3 < / version >
</dependency>

#### 3. JSON processing library

<dependency>
<groupId>org.json</groupId>
<artifactId>json</artifactId>
<version>20210307</version>
</dependency>

#### 4. JUnit 5 test library

<dependency>
<groupId>org.junit.jupiter</groupId>
<artifactId>junit-jupiter-api</artifactId>
The < version > 5.7.0 < / version >
<scope>test</scope>
</dependency>

### 7. Build and run

#### 1. Clone project:

git clone https://github.com/yourusername/chatgpt-api.git
cd chatgpt-api

#### 2. Update the OpenAI API key: 

Open ChatGPTController.java and replace the apiKey variable with your OpenAI API key:

private final String apiKey = "your-openai-api-key";

#### 3. Build the project: 

mvn clean install

#### 4. run the application: 

mvn spring-boot:run

#### 5. Test the API: 

Use Postman, curl, or any other HTTP client to send a request to the /send endpoint.