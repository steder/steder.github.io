---
layout: post
title: "Simple Nosy Script: Personal Continuous Integration for TDD"
date: 2011-09-15
comments: false
categories:
- python
- testing
- programming
---

<div class='post'>
    I recently cleaned up and resurrected my old nosy script. &nbsp;These days there are a few alternatives on PyPI as
    well though I prefer mine. &nbsp;The whole concept of nosy is simply to rerun the tests whenever the code changes.
    &nbsp;Personally, I find a script like this is really helpful for maintaining flow while doing test driven
    development.<br /><br />What I like about this nosy script is that it allows me to basically just say "run this
    nosetests / trial command every time the code changes" and nothing else. &nbsp;There's no config file to setup or
    any tool specific arguments. &nbsp;You just need to know how to use your test runner.<br /><br />Here's the code in
    case anyone is interested:&nbsp;<a
        href="https://gist.github.com/1220683">https://gist.github.com/1220683</a><br /><br />Oh, and despite the name
    I've used it successfully to work on twisted projects with trial. &nbsp;I'm also willing to bet that it would work
    just fine with py.test.<br /><br />Edit: &nbsp;The polling loop with a time.sleep(1) is eating away at me now that
    I've posted this. &nbsp;I'm thinking that the only way to live with myself is to replace that with listening for
    real filesystem events ala inotify... So do ease my conscience I'll see about doing a followup post to show what the
    script would look like with filesystem events instead of the polling loop..<br /><br /></div>