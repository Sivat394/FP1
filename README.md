## My Library: Webserver/Spin
My name: Victor Borcherds

Using the web server and a RESTful api abstraction layer for the server as my libraries I created a way to accept post requests and then repond based on if a json object was sent it or not. To actually send the requests I used a chrome extension called postman. 

Thanks to the spin abstraction layer starting the webserver to accept a post request was as easy as 

`(post "/"
  (lambda (req) (post_response req)))
  
(run)`

Example of getting something that isn't json
![js](/js.png?raw=true "not json")

sending json objects (it just sends it right back) 
![jsonin](/jsin.png?raw=true "json in")
![jsonout](/jsout.png?raw=true "json out")




