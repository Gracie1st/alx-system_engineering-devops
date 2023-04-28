What is a REST API? REST is an acronym for Representational State Transfer — an almost meaningless description of the most-used web service technology! A REST API is a way for two computer systems to communicate using the HTTP technologies found in web browsers and servers.

Sharing data between two or more systems has always been a fundamental requirement of software development. For example, consider buying motor insurance. Your insurer must obtain information about you and your vehicle so they request data from car registration authorities, credit agencies, banks, and other systems. All this happens transparently in real time to determine whether the insurer can offer a competitive policy.

APIs (Application Programming Interfaces) help this type of communication between systems by providing an interface for them to talk to each other. REST is simply a widely adopted style of API that we use to communicate with internal and external parties in a consistent and predictable way. It can be compared with how we used to send a letter with a postage stamp, address, and envelope in a certain way to ensure it gets delivered and read.

REST is commonly used by people on the web systems to interact with each other. For example, retrieving and updating account information in a social media application.



A REST API Example
Open the following link in your browser to request a random computer question from the Open Trivia Database:

https://opentdb.com/api.php?amount=1&category=18

This is a public API implemented as RESTful web service (it follows REST conventions). Your browser will show a single JSON-formatted quiz question with answers, such as:

{
  "response_code": 0,
  "results": [
    {
      "category": "Science: Computers",
      "type": "multiple",
      "difficulty": "easy",
      "question": "What does GHz stand for?",
      "correct_answer": "Gigahertz",
      "incorrect_answers": [
        "Gigahotz",
        "Gigahetz",
        "Gigahatz"
      ]
    }
  ]
}
You could request the same URL and get a response using any HTTP client, such as curl:

curl "https://opentdb.com/api.php?amount=1&category=18"
HTTP client libraries are available in all popular languages and runtimes including Fetch in JavaScript, Node.js, and Deno and file_get_contents() in PHP. A JSON response is machine-readable so it can be parsed and used before outputting HTML or other formats.


REST APIs and the Rest
Various data communication standards have evolved over the years. You may have encountered options including CORBA, SOAP, or XML-RPC. Most established strict messaging rules.

REST was defined in 2000 by Roy Fielding and is considerably simpler than the others. It’s not a standard but a set of recommendations and constraints for RESTful web services. These include:

Client-Server: SystemA makes an HTTP request to a URL hosted by SystemB, which returns a response.It’s identical to how a browser works. A browser makes a request for a specific URL. The request is routed to a web server which typically returns an HTML page. That page may contain references to images, style sheets, and JavaScript, which incur further requests and responses.
Stateless: REST is stateless: the client request should contain all the information necessary to respond.In other words, it should be possible to make two or more HTTP requests in any order, and the same responses will be received (… unless the API was designed to return random responses such as the quiz example above).
Cacheable: A response should be defined as cacheable or not.Caching improves performance because it’s not necessary to regenerate a response for the same URL. Private data specific to a certain user at a certain time would not normally be cached.
Layered: The requesting client need not know whether it’s communicating with the actual server, a proxy, or any other intermediary.
Learn to Code with JavaScript
Creating a RESTful Web Service
A RESTful web service request contains:

An Endpoint URL. An application implementing a RESTful API will define one or more URL endpoints with a domain, port, path, and/or query string — for example, https://mydomain/user/123?format=json.
The HTTP method. Differing HTTP methods can be used on any endpoint which map to application create, read, update, and delete (CRUD) operations:
HTTP method	CRUD	Action
GET	read	returns requested data
POST	create	creates a new record
PUT or PATCH	update	updates an existing record
DELETE	delete	deletes an existing record
Examples:

a GET request to /user/ returns a list of registered users on a system
a POST request to /user/ creates a user with the ID 123 using the body data (see 4. below). The response returns the ID.
a PUT request to /user/123 updates user 123 with the body data (see 4. below)
a GET request to /user/123 returns the details of user 123
a DELETE request to /user/123 deletes user 123
HTTP headers. Information such as authentication tokens or cookies can be contained in the HTTP request header.
Body Data. Data is normally transmitted in the HTTP body in an identical way to HTML <form> submissions or by sending a single JSON-encoded data string.
REST API Request Example

REST API Response
The response payload can be whatever is practical: data, HTML, an image, an audio file, and so on. Data responses are typically JSON-encoded, but XML, CSV, simple strings, or any other format can be used. You could allow the return format to be specified in the request — for example, /user/123?format=json or /user/123?format=xml.

An appropriate HTTP status code should also be set in the response header. 200 OK is used for successful requests, although 201 Created could also be returned when a record is created. Errors should return an appropriate code such as 400 Bad Request, 404 Not Found, 401 Unauthorized, and so on.

Other HTTP headers can be set including the Cache-Control or Expires directives to specify how long a response can be cached before it’s considered stale.

However, there are no strict rules. Endpoint URLs, HTTP methods, body data, and response types can be implemented as you like. For example, POST, PUT, and PATCH are often used interchangeably so any will create or update a record as necessary.
