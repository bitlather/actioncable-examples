# Action Cable Examples

A collection of examples showcasing the capabilities of Action Cable.

## Dependencies

You must have redis installed and running on the default port:6379 (or configure it in config/redis/cable.yml).

### Installing Redis
##### On Linux
* `wget http://download.redis.io/redis-stable.tar.gz`
* `tar xvzf redis-stable.tar.gz`
* `cd redis-stable`
* `make`
* `make install`

##### On Mac
* `brew install redis`

###### Note: You must have Ruby 2.2.2 installed in order to use redis

## Starting the servers

1. Run `sudo bundle install`
2. Run `sudo ./bin/setup`
3. Run `sudo ./bin/cable`
4. Open up a separate terminal and run: `sudo ./bin/rails server`
5. One more terminal to run redis server: `redis-server`
6. Visit `http://localhost:3000/integration`

### known issues
if after visiting`http://localhost:3000/integration` you see this error:

![Image](https://raw.githubusercontent.com/bitlather/actioncable-examples/875b8cb75276c12238730656938ca8b9d719e5ae/app/assets/images/image.png)

Run `sudo bin/rails db:migrate RAILS_ENV=development`

## Live comments example

1. Open two browsers with separate cookie spaces (like a regular session and an incognito session). 
2. Login as different people in each browser. 
3. Go to the same message.
4. Add comments in either browser and see them appear real-time on the counterpart screen.

![Live comments example](/example.gif?raw=true "Live comments example")
