---
layout: post
title: "New Tutorial Toolchain"
date: 2009-12-22
comments: false
---

<div class='post'>
    Previously I generated my tutorial pages&nbsp;<a href="http://penzilla.net/tutorials/python">(Python
        Tutorial)</a>&nbsp;by hand writing *.shtml files. &nbsp;I used Apache SSI (server side includes) as a very basic
    templating system to construct pages from basic building blocks. &nbsp;For each code sample I create a *py file.
    <br /><br />A makefile ties everything together by running a perl utility, code2html over all the python files to
    create *.py.html files. &nbsp;These code snippets are then inserted into the tutorial pages with include
    directives.<br /><br />I'm currently in the process of migration to a scheme that uses a real templating system
    (Genshi) and the Pygments library to build the complete tutorial. &nbsp;The finished scripts should allow me to work
    directly with HTML and Python files on disk and compile the whole thing into a complete document.
    <br /><br />Reasons for migration:<br />
    <ul>
        <li>The toolchain will be all python eases migration to Django/Twisted web layer</li>
        <li>Genshi templates will help ensure that the markup is correct and make it considerably easier to modify the
            entire tutorials look and feel going forward. &nbsp;(Or reuse these work for other tutorials I'd like to
            work on in the future). &nbsp;</li>
        <li>Pygments is an excellent syntax highligher with support for a ton of languages.</li>
    </ul>
    <div>Unfortunately:</div>
    <div>
        <ul>
            <li>There is still a build step</li>
            <li>Creating tutorials still involves writing html by hand</li>
            <li>No web interface to edit pages or create new ones</li>
        </ul>
        <div><br /></div>
    </div>
</div>