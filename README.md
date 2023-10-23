# amqpQTlib
 Cross-paltform (Windows/Linux) QT project wrapper for AMQP cpp and rabbit-c libraries

This project based on <https://github.com/alanxz/rabbitmq-c> and <https://github.com/akalend/amqpcpp> 
It aims to help anyone who would like to use rabbitMQ C++ client on Windows/Linux with QT-based projects
Should be rather easy to build it "out of the box" using MinGW/GCC (SSL headers and binaries included)

 How to build and run

 1) Clone the repo
 2) Open ..\src\rabbitmq_client\rabbitmq_client.pro with QT creator
 3) Rebuild -> libs/dlls should appear in ..\src\rabbitmq_client\lib\win32 or ..\src\rabbitmq_client\lib\unix folder 
 4) Open apqmcpp_example1.pro with QT creator and build it
 5) Check if rabbitMQ server is running, in example_publish.cpp uncomment string 
  //std::string sDefaultAddress= "guest:guest@localhost:5672";//use it with rabbitMQ installed by default
     and use it instead of 
  std::string sAddress= "user1:11@172.16.11.128:5672";
     replacing
  AMQP amqp(sAddress); ->  AMQP amqp(sDefaultAddress); 
    or put your credentials to connect rebbitMQ server
 7) Check "micro-service" queque in rabbitMQ dashboard - there should be 3 new messages        
        
