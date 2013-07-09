---
layout: post
title: "Python template language performance (Chameleon
is cool!)"
date: 2010-02-24
comments: false

---

I really like the Genshi templating library. However, it really doesn't
perform nearly as well as something like ClearSilver. Out of curiosity I
updated the benchmarks included with Genshi to include the
chameleon.genshi package. It performs amazingly well.

```
Genshi tag builder 378.72 ms
Genshi template 213.89 ms
Genshi text template 146.23 ms
Genshi template + tag builder 404.52 ms
ClearSilver 65.23 ms
Django template 423.26 ms
Chameleon Genshi Template 26.02 ms
```

These numbers are from the genshi bigtable benchmark which generates
a 1000x10 table (1000 rows of 10 numbers each). The load and creation
of the template and the construction of the list of dicts that make
up the 1000 rows of data are all done outside of the timing. All this
benchmark tests is the time to pump this data into the template and
render.

I'm still suprised by the fact that chameleon beats clearsilver here.

Ah. The ClearSilver benchmark looks something like:

``` python
def test_clearsilver():
    """ClearSilver"""
    hdf = neo_util.HDF()
    for i, row in enumerate(table):
        for j, c in enumerate(row.values()):
            hdf.setValue("rows.%d.cell.%d" % (i, j), cgi.escape(str(c)))
    cs = neo_cs.CS(hdf)
    cs.parseStr("""
    <table><?cs each:row=rows ?>
<tr><?cs each:c=row.cell ?><td><?cs var:c ?></td><?cs /each ?></tr>
<?cs /each?></table>
""")
    cs.render()
```

So now I understand why the clearsilver test is taking so long. That
benchmark code transforms
the list of dicts into an HDF dataset and does some string escapes and
so on. It's easy to
confirm that this transformation is the majority of the runtime of the
ClearSilver benchmark.

Moving that construction of the HDF dataset outside of the timed
benchmark function shows us that the majority of the time ClearSilver
spends is not rendering your content but building an HDF dataset.

{% codeblock %}
ClearSilver 3.41 ms
Chameleon Genshi Template 26.70 ms
{% endcodeblock %}

However, it is still very impressive that chameleon runs as fast as it
does given that it is able to work with the unmodified python data
structure rather then an optimized HDF dataset. And honestly in our
system I don't think we can move the construction of the HDF out of the
rendering pipeline so that \~60ms rendering time with ClearSilver is
actually going to be slower then Chameleon. Combine the speed of
Chameleon with Genshi's syntax and you've got a pretty sweet templating
system.

Of course, Chameleon's default template language (TAL) has many of the
same aspects I like about Genshi.

So let's get a number for TAL too:

{% codeblock %}
ClearSilver 65.60 ms
chameleon.genshi 25.77 ms
chameleon (TAL) 26.25 ms
{% endcodeblock %}

Comments
--------

Mike

Vishal,

You can grab the package here:
http://pypi.python.org/pypi/chameleon.genshi/

And you'll also need chameleon core:
http://pypi.python.org/pypi/Chameleon/

What few docs there are I found here:
http://chameleon.repoze.org/docs/latest/genshi.html

They are not terribly helpful, mostly I found out everything by reading
the normal chameleon docs and the official genshi docs.

Honestly, I think you're better off just using ZPT as that is both
better supported by chameleon and better documented.

Vishal

Hi Mike,

Can you provide some link for docs on chameleon.genshi?

Where can i go for this?
