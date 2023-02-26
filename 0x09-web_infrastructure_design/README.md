The Web server
A Web server handles the HTTP protocol. When the Web server receives an HTTP request, it responds with an HTTP response, such as sending back an HTML page. To process a request, a Web server may respond with a static HTML page or image, send a redirect, or delegate the dynamic response generation to some other program such as CGI scripts, JSPs (JavaServer Pages), servlets, ASPs (Active Server Pages), server-side JavaScripts, or some other server-side technology. Whatever their purpose, such server-side programs generate a response, most often in HTML, for viewing in a Web browser.

Understand that a Web server's delegation model is fairly simple. When a request comes into the Web server, the Web server simply passes the request to the program best able to handle it. The Web server doesn't provide any functionality beyond simply providing an environment in which the server-side program can execute and pass back the generated responses. The server-side program usually provides for itself such functions as transaction processing, database connectivity, and messaging.

While a Web server may not itself support transactions or database connection pooling, it may employ various strategies for fault tolerance and scalability such as load balancing, caching, and clustering—features oftentimes erroneously assigned as features reserved only for application servers.

The application server
As for the application server, according to our definition, an application server exposes business logic to client applications through various protocols, possibly including HTTP. While a Web server mainly deals with sending HTML for display in a Web browser, an application server provides access to business logic for use by client application programs. The application program can use this logic just as it would call a method on an object (or a function in the procedural world).

Such application server clients can include GUIs (graphical user interface) running on a PC, a Web server, or even other application servers. The information traveling back and forth between an application server and its client is not restricted to simple display markup. Instead, the information is program logic. Since the logic takes the form of data and method calls and not static HTML, the client can employ the exposed business logic however it wants.

In most cases, the server exposes this business logic through a component API, such as the EJB (Enterprise JavaBean) component model found on J2EE (Java 2 Platform, Enterprise Edition) application servers. Moreover, the application server manages its own resources. Such gate-keeping duties include security, transaction processing, resource pooling, and messaging. Like a Web server, an application server may also employ various scalability and fault-tolerance techniques.

An example
As an example, consider an online store that provides real-time pricing and availability information. Most likely, the site will provide a form with which you can choose a product. When you submit your query, the site performs a lookup and returns the results embedded within an HTML page. The site may implement this functionality in numerous ways. I'll show you one scenario that doesn't use an application server and another that does. Seeing how these scenarios differ will help you to see the application server's function.

Scenario 1: Web server without an application server
In the first scenario, a Web server alone provides the online store's functionality. The Web server takes your request, then passes it to a server-side program able to handle the request. The server-side program looks up the pricing information from a database or a flat file. Once retrieved, the server-side program uses the information to formulate the HTML response, then the Web server sends it back to your Web browser.

To summarize, a Web server simply processes HTTP requests by responding with HTML pages.

Scenario 2: Web server with an application server
Scenario 2 resembles Scenario 1 in that the Web server still delegates the response generation to a script. However, you can now put the business logic for the pricing lookup onto an application server. With that change, instead of the script knowing how to look up the data and formulate a response, the script can simply call the application server's lookup service. The script can then use the service's result when the script generates its HTML response.

In this scenario, the application server serves the business logic for looking up a product's pricing information. That functionality doesn't say anything about display or how the client must use the information. Instead, the client and application server send data back and forth. When a client calls the application server's lookup service, the service simply looks up the information and returns it to the client.

By separating the pricing logic from the HTML response-generating code, the pricing logic becomes far more reusable between applications. A second client, such as a cash register, could also call the same service as a clerk checks out a customer. In contrast, in Scenario 1 the pricing lookup service is not reusable because the information is embedded within the HTML page. To summarize, in Scenario 2's model, the Web server handles HTTP requests by replying with an HTML page while the application server serves application logic by processing pricing and availability requests.

Caveats
Recently, XML Web services have blurred the line between application servers and Web servers. By passing an XML payload to a Web server, the Web server can now process the data and respond much as application servers have in the past.

Additionally, most application servers also contain a Web server, meaning you can consider a Web server a subset of an application server. While application servers contain Web server functionality, developers rarely deploy application servers in that capacity. Instead, when needed, they often deploy standalone Web servers in tandem with application servers. Such a separation of functionality aids performance (simple Web requests won't impact application server performance), deployment configuration (dedicated Web servers, clustering, and so on), and allows for best-of-breed product selection.
