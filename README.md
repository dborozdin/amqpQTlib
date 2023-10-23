# amqpQTlib
 Cross-paltform (Windows/Linux) QT project wrapper for AMQP cpp and rabbit-c libraries

This project based on <https://github.com/alanxz/rabbitmq-c> and <https://github.com/akalend/amqpcpp> 
and aims to help anyone who would like to use rabbitMQ C++ client on Windows/Linux with QT-based projects.
It should be rather easy to build it "out of the box" using MinGW/GCC (SSL headers and binaries included)

 **How to build and run**

 1) Clone the repo
 2) Open _..\src\rabbitmq_client\rabbitmq_client.pro_ with QT creator
 3) Push "Rebuild" -> rabbit-c and amqp C++ libs/dlls should appear in _..\src\rabbitmq_client\lib\win32_ or _..\src\rabbitmq_client\lib\unix_ folder 
 4) Open _apqmcpp_example1.pro_ with QT creator and build it
 5) Check if rabbitMQ server is running, in _example_publish.cpp_ uncomment string
    <p>
    
 ``` 
 //std::string sDefaultAddress= "guest:guest@localhost:5672";//use it with rabbitMQ installed by default
```

and use it instead of

  ``` 
  
  std::string sAddress= "user1:11@172.16.11.128:5672";
  
  ``` 

 replacing 

 ```

 AMQP amqp(sAddress);   
 
 ```

 with
 
 ```

 AMQP amqp(sDefaultAddress);
 
 ```

or put your credentials to connect rabbitMQ server

 7) Check "_micro-service_" queque in rabbitMQ dashboard - there should be 3 new messages        
        
