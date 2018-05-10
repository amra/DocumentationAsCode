---
title: A demo document
author: Marek Hudik
lang: en
header-html: test header
footer-html: test footer
---
# Documentation demo

Hi! I'm your first Markdown file in **StackEdit**. If you want to learn about StackEdit, you can read me. If you want to play with Markdown, you can edit me. If you have finished with me, you can just create new files by opening the **file explorer** on the left corner of the navigation bar.

# Test one
<span style="color: blue; background: yellow">
ttt
</span>

# Text

## Formatting
This text is _emphasized with underscores_, and this is *emphasized with asterisks*.

This text is __emphasized with underscores__, and this is **emphasized with asterisks**.

This ~~is deleted text.~~

What is the difference between `>>=` and `>>`?

Here is a literal backtick `` ` ``.



## Links
[one with a title](http://fsf.org "click here for a good time!")

Link to [Documentation demo].

## Blocks
### Block quotations

> This is a block quote. This
> paragraph has two lines.
>
> 1. This is a list inside a block quote.
> 2. Second item.

### Verbatim (code) blocks
    if (a > 3) {
        moveShip(5 * gravity, DOWN);
    }

### Fenced code blocks
~~~~~~~
if (a > 3) {
  moveShip(5 * gravity, DOWN);
}
~~~~~~~

## List
* one
* two
* three

* fruits
    * apples
        * macintosh
        * red delicious
    - pears
    - peaches
* vegetables
    * broccoli
    + chard

1.  one
1.  two
1.  three


Term 1
:   Definition 1

Term 2 with *inline markup*
:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

# Tables
## simple_tables
-------     ------ ----------   -------
     12     12        12             12
    123     123       123           123
      1     1          1              1
-------     ------ ----------   -------

## pipe_tables

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

|                  | ASCII                           | HTML                          |
|------------------|---------------------------------|-------------------------------|
| Single backticks | `'Isn't this fun?'`             | 'Isn't this fun?'    test     |
| Quotes           | `"Isn't this fun?"`             | "Isn't this fun?"             |
| Dashes           | `-- is en-dash, --- is em-dash` | -- is en-dash, --- is em-dash |

## multiline_tables

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

## html table

<table>
<tr>
    <td colspan="3">1</td>
    <td>4</td>
    <td rowspan="3">5</td>
</tr>
<tr>
    <td>1</td>
    <td rowspan="2">2</td>
    <td>3</td>
    <td>4</td>
</tr>
<tr>
    <td rowspan="2">1</td>
    <td>3</td>
    <td>4</td>
</tr>
<tr>
    <td colspan="3">2</td>
    <td>5</td>
</tr>
<tr>
    <td>1</td>
    <td>2</td>
    <td colspan="3">3</td>
</tr>
</table>


# Images
![la lune](image/Buddy-Christ.jpg "Voyage to the moon")

![image](image/Buddy-Christ.jpg){#id .class width=30 height=20px}

![](image/Buddy-Christ.jpg){ width=50% }

# Markdown extensions

StackEdit extends the standard Markdown syntax by adding extra **Markdown extensions**, providing you with some nice features.

> **ProTip:** You can disable any **Markdown extension** in the **File properties** dialog.


## KaTeX

You can render LaTeX mathematical expressions using [KaTeX](https://khan.github.io/KaTeX/):

The *Gamma function* satisfying $\Gamma(n) = (n-1)!\quad\forall n\in\mathbb N$ is via the Euler integral

$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
$$

> You can find more information about **LaTeX** mathematical expressions [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).


## UML diagrams

You can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:

```mermaid
sequenceDiagram
Alice ->> Bob: Hello Bob, how are you?
Bob-->>John: How about you John?
Bob-->>John1: How about you John?
loop Healthcheck
    John->>John: Fight against hypochondria
end
Note right of John: Rational thoughts<br/>prevail...
Bob--x Alice: I am good thanks!
Bob-x John: I am good thanks!
Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

Bob-->Alice: Checking with John...
Alice->John: Yes... John, how are you?
```

And this will produce a flow chart:

```mermaid
graph LR
A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D
```

```mermaid
gantt
       dateFormat  YYYY-MM-DD
       title Adding GANTT diagram functionality to mermaid

       section A section
       Completed task            :done,    des1, 2014-01-06,2014-01-08
       Active task               :active,  des2, 2014-01-09, 3d
       Future task               :         des3, after des2, 5d
       Future task2              :         des4, after des3, 5d

       section Critical tasks
       Completed task in the critical line :crit, done, 2014-01-06,24h
       Implement parser and jison          :crit, done, after des1, 2d
       Create tests for parser             :crit, active, 3d
       Future task in critical line        :crit, 5d
       Create tests for renderer           :2d
       Add to mermaid                      :1d

       section Documentation
       Describe gantt syntax               :active, a1, after des1, 3d
       Add gantt diagram to demo page      :after a1  , 20h
       Add another diagram to demo page    :doc1, after a1  , 48h

       section Last section
       Describe gantt syntax               :after doc1, 3d
       Add gantt diagram to demo page      :20h
       Add another diagram to demo page    :48h
```
