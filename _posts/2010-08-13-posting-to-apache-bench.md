---
layout: post
title: "Posting with Apache Bench"
date: 2010-08-13
comments: false
---

<div class='post'>
    Because it took me a disproportionate amount of time to figure this out the second time I'm writing it
    down:<br /><br />ab -n 1000 -c 25 -p sessionkey2.post -T "application/x-www-form-urlencoded"
    "https:/<br />/127.0.0.1:8443/SessionKey"<br /><br />The trick is specifying -p &lt;postfile&gt; and -T
    &lt;content-type for post file data&gt;.<br /><br />The postfile above looks like:<br />
    <div><br /></div>
    <div>key1=value&amp;key2=another+value</div>
    <div><br /></div>
    <div>All as one long url encoded line.</div>
    <div><br /></div>
    <div>Encoding the post data is really quite easy to do in python:</div>
    <div><br /></div>
    <div>
        <code><br />import urllib<br />pv = {"key1":"value",<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"key2":"another value"}<br />print urllib.urlencode(pv)<br /></code>
    </div>
    <div><br /></div>
    <div><br /></div>
    <div><br /></div>
</div>
<h2>Comments</h2>
<div class='comments'>
    <div class='comment'>
        <div class='author'>pixou</div>
        <div class='content'>
            super thanks, saved my day !</div>
    </div>
</div>