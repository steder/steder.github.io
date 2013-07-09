--- layout: post title: "Building a startup piece by piece: Shopping
List" date: 2013-07-04 comments: false ---

If I were building a startup today here's just a braindump of software,
hardware, and services I'd pick up to build it.\
\
Software\
\
This is a long list so I'm just going to try to give a little detail
about why each thing is useful.  There is no particular order to this
list just yet as I'm just trying to organize my thoughts.\
\
\

-   Python (PyPy, CPython, IronPython):  There are other programming
    languages that are effective but for me nothing really competes with
    Python.  I think in Web Applications the Python ecosystem is really
    healthy.  Of course there are some other interesting open source
    choices like Ruby, Go, Racket (CLisp, Scheme), Node.js, OCaml, Lua,
    Scala, Haskell, Erlang, IO, Smalltalk (Seaside), etc.  And then we
    can start to talk about the less interesting but perfectly viable
    choices like C, C++, and Java.  However, I think in a startup
    environment you want to move quickly and that means that all other
    things being equal use the tool you know best.  You may disagree
    that all other things are equal when compared to the plethora of
    other languages out there but I think that in terms of the ability
    to quickly prototype and deploy a web application with reasonable
    performance characteristics it's hard to beat Python.
-   Emacs:  You need development tools.  I prefer Emacs for essentially
    everything.  Others might recommend Vim, PyCharm, TextMate, etc.
     Personally I find that again, the best tool for the job is the one
    you're most familiar with.
-   CI Server (Hudson / Jenkins):  I think that it's hard to exaggerate
    the importance of a continuous integration machine in your workflow.
     Even with a single developer the exercise of setting up a build
    server and automating your test runs removes a class of "works for
    me" type errors as well as increasing visibility into test failures
    which is critical when using automated testing to improve the
    quality of your product.  CI servers can also be used to help
    automate deployment to various environments and otherwise make your
    life easier.
-   Distributed Version Control System: While Subversion is still the
    800 lb gorilla of VCS systems it's hard to ignore the usefulness of
    distributed VCS.  I think local access to the entire version control
    history, performance, better merging, and excellent free hosting
    services really make DVCSs a better choice than SVN.  I've
    vacillated between Mercurial and Git over the last several years,
    and I've even dabbled slightly with Bazaar.  Personally I think you
    can't go too wrong with any of them but at the moment I'm thinking
    Git..  Git's downside, the awkward and counterintuitive terminology,
    is largely outweighed by it's speed and flexibility.  Personally I
    find git's builtin rebase a better fit for my mental model of
    branching (where branches are always relative of the current trunk)
    where mercurial is more about perserving history and so the
    collapsing of history done by a rebase is not recommended.
     Honestly, like Emacs or Python, I think it boils down to which one
    you know best.
-   TDD:  PyUnit, JSUnit are incredibly helpful in building always
    working code.  If you really follow the test driven mantra there is
    a test case for every line of code in your system.  While
    concurrency or unexpected user input (among other things) can
    introduce new bugs it's a way of writing self documenting code and
    ensuring that bugs once fixed stay fixed.  It also can help improve
    the design and quality of code by forcing you to make the code
    flexible enough to be easily tested and it makes it easier to test
    and validate a large number of potential inputs without requiring
    manual testing.  Manual testing can crush you if you let it.
-   Functional Test Suite:  Selenium.  In addition to testing the logic
    you probably want to test that your pages look how you think that
    should look and that the javascript that you wrote can actually work
    with the DOM on your pages in various browsers.  Integrate this into
    your CI process.
-   Performance Testing:  Blitz.io, JMeter/Grinder, httperf, etc.  You
    should having tooling that you can integrate into your CI process
    that tests the performance of your system and reports changes from
    build to build.  Ideally every release will be at least as fast as
    the last release if not faster.  Having some kind of test process
    that identifies how many requests per second you can handle and
    simulates things like performance under burst-ier loads, etc is
    really important.
-   Monitoring (?nagios, cacti, zenoss?): I think it is critical to have
    visibility into what your servers are doing at any given moment.
     Furthermore I think this information should be available to the
    whole team.  This should include low level information about CPU
    usage, memory usage, disk usage, etc.
-   Logging (?syslog, loggly?): Centralized logging across all machines
    can help with debugging, security auditing, performance testing,
    etc.  Obviously this needs to be balanced with performance concerns
    (you don't want logging to slow you down) and some conventions on
    the types of things that should be logged.
-   Load Balancing (?)
-   Static File Server (?apache, cherokee, nginx?)
-   Application Server (?twisted, django, gevent, pyramid?)
-   Caching Layer(s) (?memcache, redis?)
-   Database(es) (?couchdb, mongodb, cassandra, postgresql?)
-   Administrative Dashboards and/or Control Panels (?): Non-technical
    users within your organization are going to want to see what's going
    on in your system.  Optionally you may provide them access to the
    monitoring / logging systems but it may make more sense to build a
    custom application that these trusted non-programmers can use to see
    status of users and perform common troubleshooting or customer
    support tasks (e.g.: things like resetting user passwords,
    (un)banning users, moderating users, checking status of user jobs,
    etc). 
-   OpenSource:  I think that the best organizations are both consumers
    and producers of open source software.  On principle I prefer GPL
    but I find that in practice many people are more comfortable with
    the Apache/BSD/MIT style licenses that do not require distribution
    of your changes.  I feel like from a producers perspective the GPL
    is clearly better because you push people to contribute back.  From
    the consumers perspective a more permissive license is better
    because you can hang onto any code you feel gives you an advantage
    over your competition.  However, I feel that the GPL is probably
    superior in either case.  If you and your competition both use
    Linux, and both customize Linux, you both benefit from the others
    work.  Furthermore, on the Web people are competing more for users
    than for functionality.  For example, look at Bitbucket and Github.
     At this point they both have a bunch of overlap, and even though BB
    has free private repos and support for both git and hg it has a
    smaller userbase.  Social pressure keeps people using github.
     Github's reputation, and not its feature set, is what gives it the
    edge.  I think that unless you're in the rare position of cornering
    the market on a particular user base or niche that software is not
    what is going to make or break you but rather your agility,
    attitude, custom service, responsiveness, etc.  Basically users
    aren't 100% rational and they aren't driven by features or price as
    much as brands, social pressures, and other niceties like
    unobtrusive ads, page design, etc.  Another example is AWS and
    Rackspace.  Both are successful infrastructure as a service
    providers.  Both have opensource stacks that can be used to run your
    own infrastructure as a service (Eucalyptus and OpenStack
    respectively).  However, the real value of Rackspace or AWS is not
    the software (which again, is open source and available online for
    anyone to use or extend) but the service provided by both companies.
     Basically I believe that by the very nature of software that the
    value isn't the code but the expertise necessary to write that code
    to begin with and that by jealously hiding your source from the
    competition you're admitting that you can't compete on what really
    matters.  ~~Remember, the internet is a huge place.  Anyone entering
    the web should understand that the difficult part is not coding up
    some models and views and reading and writing data from a database
    but rather providing a service to users better than anyone else on
    the internet.  Any competitor has to convince users to jump ship and
    they have to do that through pricing, better service, or more
    features.  If they base their work on your GPL'd source code you get
    those better features too which forces them to compete on tougher
    things like service and pricing.~~

Hardware

\

It's really tempting to just say use Amazon.  Of course, Amazon has had
network hiccups before and Amazon is relatively expensive if you have a
very stable userbase.  However, for the initial period of growth I think
Amazon is hard to beat due to its elasticity.  I think your best bet is
to use Rackspace Cloud + Amazon Web Services together so that you can
have some failover and "offsite" backups and monitoring in the event of
an outage on either service.  

\

Alternatively, if you're reasonably well funded and have room for a
moderately sized server room it may be worthwhile to buy your own
hardware and a few T1's worth of internet access. 

\

Cloud Pros

-   Elastic: You can add new machines easily
-   Flexible:  You can change those machines easily
-   No big capital investment upfront.  
-   Ala carte pricing, billed only for what you use.
-   DevOps.  Your developers can script and automate operations tasks.
-   Automate provisioning

Cloud Cons

-   Higher hourly costs without committing and paying for reservations
    in 1yr/3yr terms.
-   Higher storage cost per gigabyte
-   Requires more expertise to automate and administrate
-   DevOps: Developers need to think about redundancy.
-   DevOps: Developers need to think about deployment.
-   DevOps: Developers need to think about scaling services on demand.
-   Maintenance windows for old AMI's, kernel patches, etc.  
-   Still have to sometimes deal with instance failures.

DIY Pros

-   Hardware can be very cheap and you end up paying less per hour to
    run it
-   No virtualization so you have better control and potentially get
    better resource allocation

DIY Cons

Hardware failures still happen so you need to buy extra machines and
spare parts, maintenance, etc.

Maintenance workers can cut the cable and your business is completely
offline.  

Elasticity and flexibility are expensive because you have to buy new
hardware (and perhaps new support contracts, etc).  It's all or nothing.
 If you need double capacity for a 1 week marketing blitz you have to
buy that hardware even though it's going to sit idle if that blitz
doesn't go well.

In house IT because more important

internal networking infrastructure becomes important

-   routing between internal and external networks and traffic
-   dns, dhcp

maintenance of machines, patching kernels, etc

Basically, I think the cloud is great from a flexibility and elasticity
perspective.  I also think that being able to program your deployment
(request instance from cloud provider, install packages, start service,
etc) is really awesome.  On the downside, I think the you can end up
paying more in the short term for that flexibility and I think that your
developers also need to join the ranks of DevOps.  I think that DevOps
underestimates the amount of work required for developers to own the
whole toolchain and underestimates the value of a good system
administrator.  Perhaps another pro and con chart is needed.

\

Of course, many of the downsides of DIY is buying your own hardware and
honestly any organization of a non-trivial size ends up with some IT
staff to support users.  For example, if you have sales or support
people you'll likely need some IT people to back them up.  You can
either have your developers take on this job as well or you can hire
someone just to handle this internal support role.  The real question is
more whether or not developers are supported by internal IT or whether
developers really become devops and take on the role of building,
deploying and supporting the production systems as well as developing
those systems.

\

DevOps

\

DevOps Pros

-   Developers have more control.
-   Developers understand the whole system, from their application to
    the tuning parameters for the OS and filesystem to the Database
    tuning params and configuration.
-   Developers can automate more as you can automate the provisioning of
    machines as well as deployment.
-   Continuous Deployment?

DevOps Cons

-   Developers are responsible for the whole system and can make more
    costly mistakes
-   You can spend a considerable amount of time and energy on
    deployment, infrastructure, tools, researching OSes, filesystems,
    databases, performance tuning of VMs, AWS EBS, etc. 
-   Contributes to developer stress and burnout
-   Requires developers to be on-call

I think most of my concerns about DevOps revolve around the people
developing the application and the people deploying and maintaining the
infrastructure being the same people.  

\

In my opinion if you hire N developers to build your app and M
developers to maintain the infrastructure you'd end up with N+M happier
developers and a better system than if you try to get those N+M
developers to share responsibility for those two aspects of the system.
 Further, I think what typically happens is a company hires just N
developers and expects them to handle both jobs.  Ultimately I think
that while making your developers do double duty is possible, it is not
wise.  Operating your service 365/7/24 is a full time job so you either
short change development or operations or both.  DevOps has a real cost.
 It may be the right choice for your company but you shouldn't consider
it a cost cutting measure but rather as one or more of the following
tradeoffs:

-   Features for customers vs. Infrastructure improvements:  Does your
    team spend time adding new features for your users or do they
    improve the automated backups and log rotation in production?
-   Specialization vs. generalization:  Do you hire experts in a
    particular area (Python, SQL, JS) or generalists who can work on
    anything?  
-   Event Driven vs. Task Driven:  Do you want developers constantly
    context switching as issues occur (a cert is about to expire, a
    machine is low on disk space, a node failed and needs to be
    replaced) or do you want developers pulling a task from the bug
    tracker, fixing said bug, and moving on to the next bug?
     Operations/Systems work can be very event driven.  Sure, you plan
    deployments and big infrastructure changes but you're also
    constantly responding to things going on in your system which has a
    lot of context switching overhead for developers.  Development is
    typically more Task Driven.  For example:  Improve Performance for
    Feature X by Y%, Allow users to customize their login page, refactor
    database schema for storing customer budgets, add versioning for
    widgets, etc.  Typically you'll want your devs to focus on these
    problems until they're fixed.  Some problems really only get fixed
    with focused attention for days (or weeks) at a time.  Constant
    interruptions to support users, machines, or other developers isn't
    going to get that work done efficiently. 

\

