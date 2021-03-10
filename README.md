Hypertext
=========

Hypertext authoring

Description
-----------

Hypertext allows you to write HTML from Ruby.

Usage
-----

A basic example would look like this:

```ruby
html = Hypertext.new do |h|
  h.tag :div, "data-index-number" => 123, class: "greeting" do
    h.tag :h1 do
      h.text "hello world"
    end

    h.tag :hr

    h.tag :p do
      h.text "nice to meet you"
    end
  end
end

puts html.to_s

# <div data-index-number="123" class="greeting">
#   <h1>
#     hello world
#   </h1>
#   <hr />
#   <p>
#     nice to meet you
#   </p>
# </div>
```

DSL
---

As an experimental feature, Hypertext provides a DSL for
describing an HTML document in a way that resembles
[Markaby](https://github.com/markaby/markaby).

```ruby
require "hypertext"
require "hypertext/dsl"

person_name = "Foo Bar"

html = Hypertext::DSL.new do
  form action: "/", method: "post" do
    input name: "person[name]", value: person_name
    input type: "submit"
  end
end

puts html.to_s

# <form action="/" method="post">
#   <input name="person[name]" value="Foo Bar" />
#   <input type="submit" />
# </form>
```

Installation
------------

```
$ gem install hypertext
```
