#include "AMQPcpp.h"
#include <QtDebug>


int main (int argc, char** argv) {


	using namespace std;
	try {

        //std::string sDefaultAddress= "guest:guest@localhost:5672";//use it with rabbitMQ installed by default
        std::string sAddress= "user1:11@172.16.11.128:5672";
        AMQP amqp(sAddress);

        qDebug() << "connect to: " << sAddress.c_str() << Qt::endl;
		AMQPExchange * ex = amqp.createExchange("e");
		ex->Declare("e", "fanout");

        std::string sServiceName= "micro-service";
        qDebug() << "createQueue:" << sServiceName.c_str() << Qt::endl;
        AMQPQueue * qu2 = amqp.createQueue(sServiceName);
		qu2->Declare();
		qu2->Bind( "e", "");		

		string ss = "message 1 ";
		/* test very long message
		ss = ss+ss+ss+ss+ss+ss+ss;
		ss += ss+ss+ss+ss+ss+ss+ss;
		ss += ss+ss+ss+ss+ss+ss+ss;
		ss += ss+ss+ss+ss+ss+ss+ss;
		ss += ss+ss+ss+ss+ss+ss+ss;
*/

		ex->setHeader("Delivery-mode", 2);
		ex->setHeader("Content-type", "text/text");
		ex->setHeader("Content-encoding", "UTF-8");

		ex->Publish(  ss , "");
        qDebug() << "Publish message 1:" << ss.c_str() << Qt::endl;
		ex->Publish(  "message 2 " , "");
        qDebug() << "Publish empty message 2" << Qt::endl;
		ex->Publish(  "message 3 " , "");
        qDebug() << "Publish empty message 3" << Qt::endl;
		
		
		if (argc==2) {
			AMQPQueue * qu = amqp.createQueue();			
			qu->Cancel(   amqp_cstring_bytes(argv[1]) );
		}												
						
	} catch (AMQPException e) {
		std::cout << e.getMessage() << std::endl;
	}

	return 0;

}
