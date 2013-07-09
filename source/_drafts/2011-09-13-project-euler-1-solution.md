--- layout: post title: "project euler \#1 solution" date: 2011-09-13
comments: false ---
answer = sum(set(x for x in xrange(1, 1000) if x%3 == 0 or x%5 == 0))
