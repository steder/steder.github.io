---
layout: post
title: "Twisted python development server with restart on code change"
date: 2012-10-04
comments: false

---

I really enjoy working with the Twisted framework because it allows me
to easily and cleanly blend multiple protocols and services together in
a single application.  However, when I'm developing and testing a
Twisted-based server it is sometimes inconvenient to have to manually
restart the server after each change.

Anyway, to that end I wrote a little wrapper script to run in place of
the Twisted command-line tool 'twistd' called 'twistr'.

[Twistr](https://github.com/steder/twistr) very simply wraps 'twistd' and
restarts the twistd process on changes.

If this is interesting or helpful to you feel free to check it out:

    $ pip install twistr

... should do the trick.
