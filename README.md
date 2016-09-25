Todo:

Write tests 
finish presentation of articles
Write more tests for that

Assumptions:

1. I thought about implementing a caching system for the articles per profile_id. Meaning when we have a new User on our app that we previously never seen, we would fetch the content from the endpoint. However, if the User did exist (I'm basing this off of the ip address), we would simply fetch the cached version of the articles from our db. 

However, due to the volatile nature of articles in general, I am going to presume that they will change frequently. Given that there's no immediate way on the endpoint to tell if the content has changed without actually fetching the content, there's no need for this. 