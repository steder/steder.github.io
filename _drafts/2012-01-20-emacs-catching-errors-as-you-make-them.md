--- layout: post title: "Emacs - Catching errors as you make them" date:
2012-01-20 comments: false ---
\
Previously I'd spent a little time talking about the sentient mess
represented by an Emacs users configuration file(s).  \
\
I'm looking to spend a little time each week cleaning up my Emacs
configuration and describing both why I use the features I do and how
others can tweak emacs to be more productive and to just generally have
more fun programming.\
\
So without futher ado, here's something that I use every day:\
\
\
Flymake Mode\
One of my favorite features of Emacs, especially for Python code is
Flymake. I use flymake-mode to run a syntax checker (my favorite is
pyflakes but you could easily use pylint, pychecker, etc) and so
flymake-cursor.el and mspython.el include a bunch of customizations that
take advantage of flymake.\
Basically if working correctly (pyflakes is installed and in your path)
whenever you edit a python file any lines that are highlighted have
either a syntax error, an undefined variable, unused variable, unused
import, etc. With flymake-cursor if you move point over those
highlighted lines it should show you what the error is in your modeline.
Alternatively you can do "CTRL-C CTRL-W" to run pyflakes over the module
and show the results in a separate buffer/tab. After doing that I'd hit
ALT+\` (keybindings.el binds this to 'next-error, it would normally be
bound to a function I never use) to cycle through the\
errors pyflakes points out and have it jump you to the line(s)
with problems. \
\
\
Obviously, you could do the same thing with javascript, groovy, C, java,
etc. Basically you just need a compiler or a lint like program and a
quick flymake mode hook in your config. It's really great especially in
something like Python. It catches a lot of simple but common errors
immediately after you finish typing.\
\

