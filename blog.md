---
layout: page
title: "blog"
date: 2013-09-15 13:56
comments: true
sharing: true
footer: true
---

<ul>
  {% for post in site.posts %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    {{ post.excerpt }}
  </li>
  {% endfor %}
</ul>
