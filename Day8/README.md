Today, you’ll dive into distributed logging by setting up a centralized logging system.
The following steps are to be followed :

Install Redis:

sudo apt update
sudo apt install redis-server -y

 
Enable Authentication:

Edit /etc/redis/redis.conf and enable password authentication:

//To find the location of "requirepass" we can use nano editor's search function

requirepass your_password

Restart Redis:
sudo systemctl restart redis-server
 
Configure Network Access:
Allow external access by modifying the bind setting in /etc/redis/redis.conf:

//To find the location of "bind" in network configuration we can use nano editor's search function

bind 0.0.0.0

Restart Redis:

sudo systemctl restart redis-server

-----Validation Steps -----
For Redis:Use the Redis CLI to verify the connection and authentication:

redis-cli -a your_password ping

Check the queue length:

redis-cli -a your_password LLEN logs_queue