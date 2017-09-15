--- layout: post title: "Building a startup piece by piece: Response
Time" date: 2012-01-18 comments: false ---

I'm interested in building software for the internet.  Websites and Web
applications are exciting to me in the same way chat and networked games
are exciting.  You have potentially (hopefully!) lots of users and that
leads you to work with a few very challenging constraints.\
\
For example, a popular website will receive on the order of million of
hits a day, every day.  Total number of unique users could easily be
orders of magnitude lower in the tens of thousands.\
\
Now of course when we say "per day" that's really per work day or per
some 8 to 12 hour period.  Really global / popular websites are always
attracting traffic but the average US centric website is going to be
busy really for only that core 8-12 hour window. \
\
So let's do a little math and get a sense what the technical
requirements are to handle millions of hits a day.\
\
24 request per second = ceiling(1M hits / (3600 seconds \* 12 hours))\
\
So assuming our load were evenly distributed across the same 12 hour
interval each day we'd need to be able to respond to 24 requests per
second for 12 hours straight. \
\
Let's dig a little deeper and see what it would take to handle this
idealized load:\
\
Imagine you have a social networking site where "User 1" says "Gimme
page /myfriends" and you:\
\

-   Authentic that the user is "User 1"
-   Check that "User 1" has access to the /myfriends page
-   Read the list of friends from the database
-   Build and return an HTML document including that list of friends
-   Increment your internal usage stats, activity metrics, etc.

Assume the above takes exactly 1 second.  The webserver above can handle
10 simultaneous requests with the resources available on the machine and
assuming these requests are independent (10 different users, 10
different friends lists, whatever).

\

To handle 24rps we need a total of 3 of these hypothetical webservers
and a load balancer to proxy requests to each of these machines.  Of
course adding the load balancer is going to take some time as well...
Imagine that the load balancer adds 0.1 seconds to each request.  Of
course the good news is we'd have a little bit of headroom here:

\

1.0 = (HITS \* RESPONSE\_TIME) / (CONCURRENCY \* SERVERS)

\

HITS = floor((CONCURRENCY \* SERVERS) / RESPONSE\_TIME)

\

So our max hits per second are 27 with the above resources allowing us
to handle 1.1M requests per "day".

\

Now imagine that we can handle this "Gimme page /myfriends" request in
0.1 seconds and everything else remains the same.  

\
Our response time assuming the load balancer still commits highway
robbery and steals 0.1 additional seconds is 0.2 seconds.  

\

We could now handle 150 hits a second or \~6.4M requests per "day" at
100% capacity. 

\

Of course, you probably don't want to be at 100% capacity as your
hardware is unlikely to perform its best at that level and you have no
headroom for growth, no ability to perform upgrades or update
incrementally to a new version, etc.

\

Anyway, I think that 100ms response time is perfectly reasonable goal
for a web application of medium to respectably large size.  With a load
balancer and 2 servers with 100ms response time you can handle over 2M
hits a day and be at or below 50% capacity for your service.  This gives
you time to perform maintenance, upgrades, etc as you can bring 1 server
down while still supporting your 1M page hits. It also gives you
headroom for traffic spikes, new users, etc as you're not operating at
capacity.  If nothing else it would give you time to add new servers to
your pool as you receive more hits.

\

\

\

\

\

\

\

