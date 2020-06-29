---
layout: post
title: "Using Jinja2 from Twisted"
date: 2012-02-29
comments: false
categories:
- twisted
- python
---

<div class='post'>
    <a href="http://pypi.python.org/pypi/txTemplate/1.0.0">txTemplate</a>
    is simply a set of adapters for some popular templating engines like Clearsilver,
    Genshi and Jinja2 to give them a consistent deferred-returning API.&nbsp;
    I originally hacked this up because I used
    <a href="http://www.twistedmatrix.com/">Twisted</a> and
    <a href="http://genshi.edgewall.org/">Genshi</a>
    to replace a <a href="http://www.webwareforpython.org/">Webware</a>
    and <a href="http://en.wikipedia.org/wiki/Kid_(templating_language)">Kid</a>
    application.<br /><br />You can find the package here:<br />
    <br /><a
        href="http://pypi.python.org/pypi/txTemplate/1.0.0">http://pypi.python.org/pypi/txTemplate/1.0.0</a><br /><br />And
    the source for anyone interested in hacking on it is hosted on Github.<br /><br /><a
        href="https://github.com/steder/txtemplate">https://github.com/steder/txtemplate</a><br /><br />Assuming I
    remain interested in hacking on this future enhancements will be a better incremental interface for large template
    rendering. &nbsp;The current API generates the template asynchronously but doesn't provide a good way to write the
    response to clients in chunks, the assumption being that as long as you can buffer the template in memory you can
    chunk the response to the clients. &nbsp;Also, if you don't finish rendering the template before beginning to send
    it to the client it's possible that the you'll hit an error while rendering and send only a partial response.
    <br /><br />
</div>