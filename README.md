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
  h.tag :div, class: "greeting" do |h|
    h.tag :h1 do |h|
      h.text "hello world"
    end

    h.tag :hr

    h.tag :p do |h|
      h.text "nice to meet you"
    end
  end
end

puts html.to_s

# <div class="greeting">
#   <h1>
#     hello world
#   </h1>
#   <hr />
#   <p>
#     nice to meet you
#   </p>
# </div>
```

Installation
------------

```
$ gem install hypertext
```
